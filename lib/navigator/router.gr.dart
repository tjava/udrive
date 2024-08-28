// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:udrive/features/auth/presentation/pages/login_page.dart' as _i3;
import 'package:udrive/features/auth/presentation/pages/register_page.dart'
    as _i8;
import 'package:udrive/features/home/domain/entities/user_entity.dart' as _i11;
import 'package:udrive/features/home/presentation/pages/home_page.dart' as _i1;
import 'package:udrive/features/layout/presentation/pages/layout_page.dart'
    as _i2;
import 'package:udrive/features/onboarding/presentation/pages/onboarding1_page.dart'
    as _i4;
import 'package:udrive/features/onboarding/presentation/pages/onboarding2_page.dart'
    as _i5;
import 'package:udrive/features/onboarding/presentation/pages/onboarding3_page.dart'
    as _i6;
import 'package:udrive/features/onboarding/presentation/pages/onboarding4_page.dart'
    as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(
          key: args.key,
          userEntity: args.userEntity,
        ),
      );
    },
    LayoutRoute.name: (routeData) {
      final args = routeData.argsAs<LayoutRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LayoutPage(
          key: args.key,
          userEntity: args.userEntity,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    Onboarding1Route.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Onboarding1Page(),
      );
    },
    Onboarding2Route.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Onboarding2Page(),
      );
    },
    Onboarding3Route.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Onboarding3Page(),
      );
    },
    Onboarding4Route.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Onboarding4Page(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i10.Key? key,
    required _i11.UserEntity userEntity,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            userEntity: userEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<HomeRouteArgs> page =
      _i9.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.userEntity,
  });

  final _i10.Key? key;

  final _i11.UserEntity userEntity;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, userEntity: $userEntity}';
  }
}

/// generated route for
/// [_i2.LayoutPage]
class LayoutRoute extends _i9.PageRouteInfo<LayoutRouteArgs> {
  LayoutRoute({
    _i10.Key? key,
    required _i11.UserEntity userEntity,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LayoutRoute.name,
          args: LayoutRouteArgs(
            key: key,
            userEntity: userEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i9.PageInfo<LayoutRouteArgs> page =
      _i9.PageInfo<LayoutRouteArgs>(name);
}

class LayoutRouteArgs {
  const LayoutRouteArgs({
    this.key,
    required this.userEntity,
  });

  final _i10.Key? key;

  final _i11.UserEntity userEntity;

  @override
  String toString() {
    return 'LayoutRouteArgs{key: $key, userEntity: $userEntity}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Onboarding1Page]
class Onboarding1Route extends _i9.PageRouteInfo<void> {
  const Onboarding1Route({List<_i9.PageRouteInfo>? children})
      : super(
          Onboarding1Route.name,
          initialChildren: children,
        );

  static const String name = 'Onboarding1Route';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Onboarding2Page]
class Onboarding2Route extends _i9.PageRouteInfo<void> {
  const Onboarding2Route({List<_i9.PageRouteInfo>? children})
      : super(
          Onboarding2Route.name,
          initialChildren: children,
        );

  static const String name = 'Onboarding2Route';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.Onboarding3Page]
class Onboarding3Route extends _i9.PageRouteInfo<void> {
  const Onboarding3Route({List<_i9.PageRouteInfo>? children})
      : super(
          Onboarding3Route.name,
          initialChildren: children,
        );

  static const String name = 'Onboarding3Route';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Onboarding4Page]
class Onboarding4Route extends _i9.PageRouteInfo<void> {
  const Onboarding4Route({List<_i9.PageRouteInfo>? children})
      : super(
          Onboarding4Route.name,
          initialChildren: children,
        );

  static const String name = 'Onboarding4Route';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
