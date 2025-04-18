import 'package:grpc/grpc.dart';
import 'package:bsms2/generated/sms.pb.dart';
import 'package:bsms2/generated/sms.pbgrpc.dart';

class SmsGrpcService {
  static final SmsGrpcService _instance = SmsGrpcService._internal();
  late SmsServiceClient _client;

  factory SmsGrpcService() => _instance;

  SmsGrpcService._internal() {
    final channel = ClientChannel(
      'your.server.ip',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _client = SmsServiceClient(channel);
  }

  Future<bool> sendSmsToServer(SmsMessage msg) async {
    try {
      final request = SmsRequest()
        ..address = msg.address ?? ''
        ..body = msg.body ?? ''
        ..date = msg.date ?? DateTime.now().millisecondsSinceEpoch;

      final response = await _client.sendSms(request);
      return response.success;
    } catch (e) {
      print('Error sending SMS to server: $e');
      return false;
    }
  }
}