import 'package:bou/services/app_router.dart';
import 'package:bou/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

// class AuthProvider extends ChangeNotifier {
//   bool _isLoggedIn = false;
//
//   static final AuthProvider authProvider = AuthProvider();
//
//   bool get isLoggedIn => _isLoggedIn;
//
//   void login() {
//     _isLoggedIn = true;
//     notifyListeners();
//   }
//
//   void logout() {
//     _isLoggedIn = false;
//     notifyListeners();
//   }
// }

// AuthProvider _myAuthProvider = AuthProvider();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp.router(
            title: 'bou',
            locale: const Locale('fa', 'IR'),
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('fa', 'IR'),
            ],
            localizationsDelegates: const [
              PersianMaterialLocalizations.delegate,
              PersianCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: _appRouter.config(
              reevaluateListenable: authProvider,
            ),
            builder: (context, child) {
              return Directionality(
                  textDirection: TextDirection.ltr, child: child!);
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              radioTheme: const RadioThemeData(
                  fillColor: WidgetStatePropertyAll(Color(0xff536471))),
              checkboxTheme: CheckboxThemeData(
                  fillColor: const WidgetStatePropertyAll(Colors.white),
                  side: const BorderSide(color: Color(0xff536471), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  checkColor: const WidgetStatePropertyAll(Color(0xff536471))),
            ),
          );
        },
      ),
    );
  }
}

//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   final _appRouter = AppRouter();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'bou',
//       locale: const Locale('fa', 'IR'),
//       supportedLocales: const [
//         Locale('en', 'US'),
//         Locale('fa', 'IR'),
//       ],
//       localizationsDelegates: const [
//         PersianMaterialLocalizations.delegate,
//         PersianCupertinoLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//
//
//
//       routerConfig: _appRouter.config(
//         // reevaluateListenable: AuthProvider.authProvider,
//         reevaluateListenable: authProvider,
//       ),
//       builder: (context, child) {
//         return Directionality(textDirection: TextDirection.ltr, child: child!);
//       },
//
//       // routerConfig: _appRouter.config(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         radioTheme: const RadioThemeData(
//             fillColor: WidgetStatePropertyAll(Color(0xff536471))),
//         checkboxTheme: CheckboxThemeData(
//             fillColor: const WidgetStatePropertyAll(Colors.white),
//             side: const BorderSide(color: Color(0xff536471), width: 2),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//
//             // shape: LinearBorder(),
//             checkColor: const WidgetStatePropertyAll(Color(0xff536471))),
//       ),
//     );
//   }
// }
