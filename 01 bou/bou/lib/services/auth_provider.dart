import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static final AuthProvider authProvider = AuthProvider();

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? token = await storage.read(key: 'auth_token');
    _isLoggedIn = token != null;
    notifyListeners();
  }

  final fakeToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.fake.token";

  void login() async {
    await storage.write(key: 'auth_token', value: fakeToken);
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() async {
    await storage.delete(key: 'auth_token');
    _isLoggedIn = false;
    notifyListeners();
  }
}