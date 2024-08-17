// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:bou/homepage/homepage.dart' as _i5;
import 'package:bou/login/login.dart' as _i3;
import 'package:bou/notification/notifications.dart' as _i6;
import 'package:bou/post/addpost.dart' as _i1;
import 'package:bou/post/comments.dart' as _i4;
import 'package:bou/profile/editprofile.dart' as _i2;
import 'package:bou/profile/otheraccount.dart' as _i9;
import 'package:bou/profile/profile.dart' as _i7;
import 'package:bou/search/search.dart' as _i8;
import 'package:bou/useless/useless1.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddPostRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPostPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditProfilePage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    MyCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<MyCommentsRouteArgs>(
          orElse: () => const MyCommentsRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MyCommentsPage(key: args.key),
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MyHomePage(),
      );
    },
    MyNotificationsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyNotificationsPage(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MyProfilePage(),
      );
    },
    MySearchRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MySearchPage(),
      );
    },
    OtherAccountsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OtherAccountsPage(),
      );
    },
    Useless1Route.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Useless1Page(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPostPage]
class AddPostRoute extends _i11.PageRouteInfo<void> {
  const AddPostRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditProfilePage]
class EditProfileRoute extends _i11.PageRouteInfo<void> {
  const EditProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i12.Key? key,
    required void Function(bool) onLoginResult,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<LoginRouteArgs> page =
      _i11.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onLoginResult,
  });

  final _i12.Key? key;

  final void Function(bool) onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i4.MyCommentsPage]
class MyCommentsRoute extends _i11.PageRouteInfo<MyCommentsRouteArgs> {
  MyCommentsRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MyCommentsRoute.name,
          args: MyCommentsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MyCommentsRoute';

  static const _i11.PageInfo<MyCommentsRouteArgs> page =
      _i11.PageInfo<MyCommentsRouteArgs>(name);
}

class MyCommentsRouteArgs {
  const MyCommentsRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'MyCommentsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.MyHomePage]
class MyHomeRoute extends _i11.PageRouteInfo<void> {
  const MyHomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MyNotificationsPage]
class MyNotificationsRoute extends _i11.PageRouteInfo<void> {
  const MyNotificationsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyNotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyNotificationsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MyProfilePage]
class MyProfileRoute extends _i11.PageRouteInfo<void> {
  const MyProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MySearchPage]
class MySearchRoute extends _i11.PageRouteInfo<void> {
  const MySearchRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySearchRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OtherAccountsPage]
class OtherAccountsRoute extends _i11.PageRouteInfo<void> {
  const OtherAccountsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OtherAccountsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherAccountsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Useless1Page]
class Useless1Route extends _i11.PageRouteInfo<void> {
  const Useless1Route({List<_i11.PageRouteInfo>? children})
      : super(
          Useless1Route.name,
          initialChildren: children,
        );

  static const String name = 'Useless1Route';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
