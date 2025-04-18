import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:another_telephony/telephony.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _requestPermissions();
  await SmsService.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const SmsBackupApp());
}

Future<void> _requestPermissions() async {
  await Permission.storage.request();
  await Permission.sms.request();
  await Permission.manageExternalStorage.request();
}

class SmsBackupApp extends StatelessWidget {
  const SmsBackupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Backup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SafeArea(
        child: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Telephony _telephony = Telephony.instance;
  bool _isListening = false;
  Timer? _autoCheckTimer;

  @override
  void initState() {
    super.initState();
    _initSmsListener();
    SmsService.checkInitialMessages().catchError((e) {
      debugPrint('Failed in first getting messages! $e');
    });

    _autoCheckTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _checkRecentMessages();
    });
  }

  @override
  void dispose() {
    _autoCheckTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }

  Future<void> _checkRecentMessages() async {
    try {
      await SmsService.checkRecentMessages();
      _showSnackbar('Recent Messages checked.');
    } catch (e) {
      _showSnackbar('Error: $e');
    }
  }

  Future<void> _initSmsListener() async {
    try {
      _telephony.listenIncomingSms(
        onNewMessage: (SmsMessage msg) async {
          if (!mounted) return;
          await SmsService.saveNewMessage(msg);
        },
        listenInBackground: true,
        onBackgroundMessage: backgroundMessageHandler,
      );
      setState(() => _isListening = true);
    } catch (e) {
      debugPrint('Failed in sms listener: $e');
      setState(() => _isListening = false);
    }
  }

  @pragma('vm:entry-point')
  static Future<void> backgroundMessageHandler(SmsMessage msg) async {
    await SmsService.saveNewMessage(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sms,
              size: 100,
              color: _isListening ? Colors.blue : Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              _isListening
                  ? 'Reading new Messages.'
                  : 'Failed in reading messages! ',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Check recent messages.'),
              onPressed: _checkRecentMessages,
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class SmsService {
  static SharedPreferences? _prefs;
  static final Set<String> _savedMessages = {};
  static DateTime? _lastCheckTime;
  static final Telephony _telephony = Telephony.instance;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _lastCheckTime = DateTime.fromMillisecondsSinceEpoch(
        _prefs?.getInt('lastCheckTime') ?? 0);

    _savedMessages.addAll(_prefs?.getStringList('savedMessages') ?? []);
  }

  static Future<void> checkInitialMessages() async {
    try {
      final threshold = DateTime.now().subtract(const Duration(minutes: 30));
      final messages = await _telephony.getInboxSms(
        filter: SmsFilter.where(SmsColumn.DATE)
            .greaterThan(threshold.millisecondsSinceEpoch.toString()),
      );

      for (final msg in messages) {
        if (!_isMessageSaved(msg)) {
          await saveNewMessage(msg);
        }
      }

      _updateLastCheckTime();
      debugPrint('First check of recent messages Done.');
    } catch (e) {
      debugPrint('Failed in checking recent messages: $e');
      rethrow;
    }
  }

  static Future<String> get _backupPath async {
    final dir = await getDownloadsDirectory() ??
        await getApplicationDocumentsDirectory();
    final backupDir = Directory('${dir.path}/SMS_Backup');

    if (!await backupDir.exists()) {
      await backupDir.create(recursive: true);
    }

    return '${backupDir.path}/sms_backup_${DateTime.now().millisecondsSinceEpoch}.json';
  }

  static Future<void> saveNewMessage(SmsMessage msg) async {
    try {
      if (_isMessageSaved(msg) || !_isWithin30Minutes(msg.date)) return;

      final file = File(await _backupPath);
      final data = _createMessageData(msg);
      await file.writeAsString('${jsonEncode(data)}\n', mode: FileMode.append);

      _markMessageAsSaved(msg);
      _updateLastCheckTime();
      debugPrint('New message saved: ${msg.address}');
    } catch (e) {
      debugPrint('Faield to save message: $e');
    }
  }

  static bool _isWithin30Minutes(int? msgDate) {
    if (msgDate == null) return false;
    final msgTime = DateTime.fromMillisecondsSinceEpoch(msgDate);
    final threshold = DateTime.now().subtract(const Duration(minutes: 30));
    return msgTime.isAfter(threshold);
  }

  static void _updateLastCheckTime() {
    _lastCheckTime = DateTime.now();
    _prefs?.setInt('lastCheckTime', _lastCheckTime!.millisecondsSinceEpoch);
  }

  static Future<void> checkRecentMessages() async {
    try {
      final messages = await _telephony.getInboxSms();
      for (final msg in messages) {
        if (!_isMessageSaved(msg) && _isWithin30Minutes(msg.date)) {
          await saveNewMessage(msg);
        }
      }
      debugPrint('Auto check Done.');
    } catch (e) {
      debugPrint('Failed in auto check: $e');
    }
  }

  static bool _isMessageSaved(SmsMessage msg) {
    return _savedMessages.contains(_getMessageUniqueId(msg));
  }

  static void _markMessageAsSaved(SmsMessage msg) {
    final id = _getMessageUniqueId(msg);
    _savedMessages.add(id);
    _prefs?.setStringList('savedMessages', _savedMessages.toList());
  }

  static String _getMessageUniqueId(SmsMessage msg) {
    return '${msg.address}_${msg.body}_${msg.date}';
  }

  static Map<String, dynamic> _createMessageData(SmsMessage msg) {
    return {
      'address': msg.address,
      'body': msg.body,
      'date': msg.date,
    };
  }
}
