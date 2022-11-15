// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/auth/auth_page.dart' as _i2;
import '../pages/home/home_page.dart' as _i3;
import '../pages/main_pages_page.dart' as _i1;

class MainRouter extends _i4.RootStackRouter {
  MainRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoutes.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPages(),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
        transitionsBuilder: _i4.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MainRoutes.name,
          path: '/main-pages',
          children: [
            _i4.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoutes.name,
            )
          ],
        ),
        _i4.RouteConfig(
          AuthRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.MainPages]
class MainRoutes extends _i4.PageRouteInfo<void> {
  const MainRoutes({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoutes.name,
          path: '/main-pages',
          initialChildren: children,
        );

  static const String name = 'MainRoutes';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}
