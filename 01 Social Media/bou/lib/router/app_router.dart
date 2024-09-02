import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthGuard authGuard = AuthGuard(); // Instantiate the guard

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page, guards: [authGuard], initial: true),
        AutoRoute(page: MyProfileRoute.page, guards: [authGuard]),
        AutoRoute(page: MyCommentsRoute.page, guards: [authGuard]),
        AutoRoute(page: MySearchRoute.page, guards: [authGuard]),
        AutoRoute(page: MyNotificationsRoute.page, guards: [authGuard]),
        AutoRoute(page: OtherAccountsRoute.page, guards: [authGuard]),
        CustomRoute(
            page: EditProfileRoute.page,
            durationInMilliseconds: 200,
            guards: [authGuard]),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AddPostRoute.page, guards: [authGuard]),
        AutoRoute(page: Useless1Route.page, guards: [authGuard]),
        AutoRoute(page: HamsterRoute.page, guards: [authGuard]),
        AutoRoute(page: QRViewExample.page, guards: [authGuard]),
      ];
}
