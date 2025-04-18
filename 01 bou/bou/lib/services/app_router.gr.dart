// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:bou/pages/addpost.dart' as _i1;
import 'package:bou/pages/comments.dart' as _i7;
import 'package:bou/pages/editprofile.dart' as _i3;
import 'package:bou/pages/hamster.dart' as _i4;
import 'package:bou/pages/homepage.dart' as _i8;
import 'package:bou/pages/login.dart' as _i5;
import 'package:bou/pages/main_page.dart' as _i6;
import 'package:bou/pages/my_restful_http_request.dart' as _i2;
import 'package:bou/pages/notifications.dart' as _i9;
import 'package:bou/pages/otheraccount.dart' as _i12;
import 'package:bou/pages/profile.dart' as _i10;
import 'package:bou/pages/qr_code_scanner.dart' as _i13;
import 'package:bou/pages/search.dart' as _i11;
import 'package:bou/pages/useless1.dart' as _i14;
import 'package:bou/pages/useless2.dart' as _i15;
import 'package:flutter/material.dart' as _i17;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AddPostRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPostPage(),
      );
    },
    ApiTestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ApiTestPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditProfilePage(),
      );
    },
    HamsterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HamsterPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainPage(),
      );
    },
    MyCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<MyCommentsRouteArgs>(
          orElse: () => const MyCommentsRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MyCommentsPage(key: args.key),
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MyHomePage(),
      );
    },
    MyNotificationsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MyNotificationsPage(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyProfilePage(),
      );
    },
    MySearchRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MySearchPage(),
      );
    },
    OtherAccountsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OtherAccountsPage(),
      );
    },
    QRScanRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.QRScanPage(),
      );
    },
    Useless1Route.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Useless1Page(),
      );
    },
    Useless2Route.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.Useless2Page(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPostPage]
class AddPostRoute extends _i16.PageRouteInfo<void> {
  const AddPostRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ApiTestPage]
class ApiTestRoute extends _i16.PageRouteInfo<void> {
  const ApiTestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ApiTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiTestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditProfilePage]
class EditProfileRoute extends _i16.PageRouteInfo<void> {
  const EditProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HamsterPage]
class HamsterRoute extends _i16.PageRouteInfo<void> {
  const HamsterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HamsterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HamsterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i17.Key? key,
    required void Function(bool) onLoginResult,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<LoginRouteArgs> page =
      _i16.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onLoginResult,
  });

  final _i17.Key? key;

  final void Function(bool) onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MyCommentsPage]
class MyCommentsRoute extends _i16.PageRouteInfo<MyCommentsRouteArgs> {
  MyCommentsRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          MyCommentsRoute.name,
          args: MyCommentsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MyCommentsRoute';

  static const _i16.PageInfo<MyCommentsRouteArgs> page =
      _i16.PageInfo<MyCommentsRouteArgs>(name);
}

class MyCommentsRouteArgs {
  const MyCommentsRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'MyCommentsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.MyHomePage]
class MyHomeRoute extends _i16.PageRouteInfo<void> {
  const MyHomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyNotificationsPage]
class MyNotificationsRoute extends _i16.PageRouteInfo<void> {
  const MyNotificationsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MyNotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyNotificationsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MyProfilePage]
class MyProfileRoute extends _i16.PageRouteInfo<void> {
  const MyProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MySearchPage]
class MySearchRoute extends _i16.PageRouteInfo<void> {
  const MySearchRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySearchRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OtherAccountsPage]
class OtherAccountsRoute extends _i16.PageRouteInfo<void> {
  const OtherAccountsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OtherAccountsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherAccountsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.QRScanPage]
class QRScanRoute extends _i16.PageRouteInfo<void> {
  const QRScanRoute({List<_i16.PageRouteInfo>? children})
      : super(
          QRScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'QRScanRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Useless1Page]
class Useless1Route extends _i16.PageRouteInfo<void> {
  const Useless1Route({List<_i16.PageRouteInfo>? children})
      : super(
          Useless1Route.name,
          initialChildren: children,
        );

  static const String name = 'Useless1Route';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.Useless2Page]
class Useless2Route extends _i16.PageRouteInfo<void> {
  const Useless2Route({List<_i16.PageRouteInfo>? children})
      : super(
          Useless2Route.name,
          initialChildren: children,
        );

  static const String name = 'Useless2Route';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
