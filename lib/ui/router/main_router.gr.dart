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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../greeting/greeting_logo_page.dart' as _i3;
import '../greeting/greeting_welcome.dart' as _i2;
import '../pages/auth/auth_page.dart' as _i4;
import '../pages/home/home_page.dart' as _i5;
import '../pages/main_pages_page.dart' as _i1;

class MainRouter extends _i6.RootStackRouter {
  MainRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoutes.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPages(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GreetingWelcomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.GreetingWelcomePage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GreetingLogoRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.GreetingLogoPage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthPage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          MainRoutes.name,
          path: '/main-pages',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoutes.name,
            )
          ],
        ),
        _i6.RouteConfig(
          GreetingWelcomeRoute.name,
          path: '/greeting-welcome-page',
        ),
        _i6.RouteConfig(
          GreetingLogoRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          AuthRoute.name,
          path: '/auth-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPages]
class MainRoutes extends _i6.PageRouteInfo<void> {
  const MainRoutes({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoutes.name,
          path: '/main-pages',
          initialChildren: children,
        );

  static const String name = 'MainRoutes';
}

/// generated route for
/// [_i2.GreetingWelcomePage]
class GreetingWelcomeRoute extends _i6.PageRouteInfo<void> {
  const GreetingWelcomeRoute()
      : super(
          GreetingWelcomeRoute.name,
          path: '/greeting-welcome-page',
        );

  static const String name = 'GreetingWelcomeRoute';
}

/// generated route for
/// [_i3.GreetingLogoPage]
class GreetingLogoRoute extends _i6.PageRouteInfo<void> {
  const GreetingLogoRoute()
      : super(
          GreetingLogoRoute.name,
          path: '/',
        );

  static const String name = 'GreetingLogoRoute';
}

/// generated route for
/// [_i4.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth-page',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}
