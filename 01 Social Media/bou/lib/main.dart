import 'package:bou/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  static final AuthProvider authProvider = AuthProvider();

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

// AuthProvider _myAuthProvider = AuthProvider();

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        reevaluateListenable: AuthProvider.authProvider,
      ),

      // routerConfig: _appRouter.config(),
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

            // shape: LinearBorder(),
            checkColor: const WidgetStatePropertyAll(Color(0xff536471))),
      ),
    );
  }
}
