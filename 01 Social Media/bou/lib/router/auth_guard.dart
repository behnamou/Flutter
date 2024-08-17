import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:bou/main.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // Check if the user is logged in
    if (AuthProvider.authProvider.isLoggedIn) {
      // If logged in, continue to the requested route
      resolver.next(true);
    } else {
      // If not logged in, redirect to the login page
      router.replace(
        LoginRoute(
          onLoginResult: (result) {
            if (result) {
              router.popForced();
              // router.replace(const MyHomeRoute());

              resolver.next(true);
            }
          },
        ),
      );
    }
  }
}
