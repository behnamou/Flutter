import 'package:auto_route/auto_route.dart';
import 'package:bou/services/app_router.gr.dart';
import 'package:bou/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authProvider = Provider.of<AuthProvider>(router.navigatorKey.currentContext!, listen: false);
    // bool loggedIn = await isLoggedIn();
    // Check if the user is logged in
    if (authProvider.isLoggedIn) {
      // if (loggedIn) {
      // If logged in, continue to the requested route
      resolver.next(true);
    } else {
      // If not logged in, redirect to the login page
      router.replace(
        LoginRoute(
          onLoginResult: (result) {
            if (result) {
              router.popForced();
              // router.replace(const MyHomeRoute());d

              resolver.next(true);
            }
          },
        ),
      );
    }
  }
}

//   final storage = FlutterSecureStorage();
//
//   Future<bool> isLoggedIn() async {
//     String? token = await storage.read(key: 'auth_token');
//     return token != null;
//   }
// }
