import 'package:auto_route/auto_route.dart';
import 'package:bou/services/app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthGuard authGuard = AuthGuard(); // Instantiate the guard

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          guards: [authGuard],
          initial: true,
          children: [
            AutoRoute(page: MyHomeRoute.page, initial: true),
            AutoRoute(page: MyProfileRoute.page),
            AutoRoute(page: MySearchRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: MyCommentsRoute.page, guards: [authGuard]),
        AutoRoute(page: MyNotificationsRoute.page, guards: [authGuard]),
        AutoRoute(page: OtherAccountsRoute.page, guards: [authGuard]),
        AutoRoute(page: EditProfileRoute.page, guards: [authGuard]),
        AutoRoute(page: AddPostRoute.page, guards: [authGuard]),
        AutoRoute(page: Useless1Route.page, guards: [authGuard]),
        AutoRoute(page: HamsterRoute.page, guards: [authGuard]),
        AutoRoute(page: ApiTestRoute.page, guards: [authGuard]),
        AutoRoute(page: Useless2Route.page, guards: [authGuard]),
        AutoRoute(page: QRScanRoute.page, guards: [authGuard]),
      ];
}

//  flutter pub run build_runner build
//  flutter pub run build_runner build --delete-conflicting-outputs

// AutoRoute(page: MyHomeRoute.page, guards: [authGuard]),
//         // AutoRoute(page: MyProfileRoute.page, guards: [authGuard]),
//         // AutoRoute(page: MyCommentsRoute.page, guards: [authGuard]),
//         // AutoRoute(page: MySearchRoute.page, guards: [authGuard]),
//         // AutoRoute(page: MyNotificationsRoute.page, guards: [authGuard]),
//         // AutoRoute(page: OtherAccountsRoute.page, guards: [authGuard]),
//         // CustomRoute(
//         //     page: EditProfileRoute.page,
//         //     durationInMilliseconds: 200,
//         //     guards: [authGuard]),
//         AutoRoute(page: LoginRoute.page),
//         // AutoRoute(page: AddPostRoute.page, guards: [authGuard]),
//         // AutoRoute(page: Useless1Route.page, guards: [authGuard]),
//         // AutoRoute(page: HamsterRoute.page, guards: [authGuard]),
//         // AutoRoute(page: ApiTestRoute.page, guards: [authGuard]),
//         // AutoRoute(page: Useless2Route.page, guards: [authGuard]),
//         // AutoRoute(page: QRScanRoute.page, guards: [authGuard]),
