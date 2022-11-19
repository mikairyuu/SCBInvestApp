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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/auth/auth_page.dart' as _i3;
import '../pages/greeting/greeting_welcome.dart' as _i2;
import '../pages/main/chat/chat_page.dart' as _i8;
import '../pages/main/feed/feed_page.dart' as _i7;
import '../pages/main/home/home_page.dart' as _i5;
import '../pages/main/market/market_page.dart' as _i6;
import '../pages/main/profile/profile_page.dart' as _i9;
import '../pages/main_pages_page.dart' as _i1;
import '../pages/pin/pin_enter_page.dart' as _i4;
import 'auth_guard.dart' as _i12;

class MainRouter extends _i10.RootStackRouter {
  MainRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainRoutes.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPages(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GreetingWelcomeRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.GreetingWelcomePage(),
        transitionsBuilder: _i10.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthPage(),
        transitionsBuilder: _i10.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PinEnterRoute.name: (routeData) {
      final args = routeData.argsAs<PinEnterRouteArgs>();
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.PinEnterPage(
          key: args.key,
          isRegister: args.isRegister,
        ),
        transitionsBuilder: _i10.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MarketRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.MarketPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FeedRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.FeedPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.ChatPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfilePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          MainRoutes.name,
          path: '/main-pages',
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoutes.name,
            ),
            _i10.RouteConfig(
              MarketRoute.name,
              path: 'market-page',
              parent: MainRoutes.name,
            ),
            _i10.RouteConfig(
              FeedRoute.name,
              path: 'feed-page',
              parent: MainRoutes.name,
            ),
            _i10.RouteConfig(
              ChatRoute.name,
              path: 'chat-page',
              parent: MainRoutes.name,
            ),
            _i10.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: MainRoutes.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          GreetingWelcomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          AuthRoute.name,
          path: '/auth-page',
        ),
        _i10.RouteConfig(
          PinEnterRoute.name,
          path: '/pin-enter-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPages]
class MainRoutes extends _i10.PageRouteInfo<void> {
  const MainRoutes({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoutes.name,
          path: '/main-pages',
          initialChildren: children,
        );

  static const String name = 'MainRoutes';
}

/// generated route for
/// [_i2.GreetingWelcomePage]
class GreetingWelcomeRoute extends _i10.PageRouteInfo<void> {
  const GreetingWelcomeRoute()
      : super(
          GreetingWelcomeRoute.name,
          path: '/',
        );

  static const String name = 'GreetingWelcomeRoute';
}

/// generated route for
/// [_i3.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth-page',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i4.PinEnterPage]
class PinEnterRoute extends _i10.PageRouteInfo<PinEnterRouteArgs> {
  PinEnterRoute({
    _i11.Key? key,
    required bool isRegister,
  }) : super(
          PinEnterRoute.name,
          path: '/pin-enter-page',
          args: PinEnterRouteArgs(
            key: key,
            isRegister: isRegister,
          ),
        );

  static const String name = 'PinEnterRoute';
}

class PinEnterRouteArgs {
  const PinEnterRouteArgs({
    this.key,
    required this.isRegister,
  });

  final _i11.Key? key;

  final bool isRegister;

  @override
  String toString() {
    return 'PinEnterRouteArgs{key: $key, isRegister: $isRegister}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.MarketPage]
class MarketRoute extends _i10.PageRouteInfo<void> {
  const MarketRoute()
      : super(
          MarketRoute.name,
          path: 'market-page',
        );

  static const String name = 'MarketRoute';
}

/// generated route for
/// [_i7.FeedPage]
class FeedRoute extends _i10.PageRouteInfo<void> {
  const FeedRoute()
      : super(
          FeedRoute.name,
          path: 'feed-page',
        );

  static const String name = 'FeedRoute';
}

/// generated route for
/// [_i8.ChatPage]
class ChatRoute extends _i10.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: 'chat-page',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
