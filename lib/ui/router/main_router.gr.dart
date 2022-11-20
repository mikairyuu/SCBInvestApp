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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../domain/entity/stock_data.dart' as _i14;
import '../pages/auth/auth_page.dart' as _i4;
import '../pages/greeting/greeting_welcome.dart' as _i3;
import '../pages/main/chat/chat_page.dart' as _i9;
import '../pages/main/feed/feed_page.dart' as _i8;
import '../pages/main/home/home_page.dart' as _i6;
import '../pages/main/market/market_page.dart' as _i7;
import '../pages/main/market/stock_view_page.dart' as _i2;
import '../pages/main/profile/profile_page.dart' as _i10;
import '../pages/main_pages_page.dart' as _i1;
import '../pages/pin/pin_enter_page.dart' as _i5;
import 'auth_guard.dart' as _i13;

class MainRouter extends _i11.RootStackRouter {
  MainRouter({
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i13.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MainRoutes.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPages(),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StockViewRoute.name: (routeData) {
      final args = routeData.argsAs<StockViewRouteArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.StockViewPage(
          key: args.key,
          stock: args.stock,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    GreetingWelcomeRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.GreetingWelcomePage(),
        transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthPage(),
        transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PinEnterRoute.name: (routeData) {
      final args = routeData.argsAs<PinEnterRouteArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.PinEnterPage(
          key: args.key,
          isRegister: args.isRegister,
        ),
        transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MarketRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.MarketPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FeedRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.FeedPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.ChatPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfilePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          MainRoutes.name,
          path: '/main-pages',
          children: [
            _i11.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoutes.name,
            ),
            _i11.RouteConfig(
              MarketRoute.name,
              path: 'market-page',
              parent: MainRoutes.name,
            ),
            _i11.RouteConfig(
              FeedRoute.name,
              path: 'feed-page',
              parent: MainRoutes.name,
            ),
            _i11.RouteConfig(
              ChatRoute.name,
              path: 'chat-page',
              parent: MainRoutes.name,
            ),
            _i11.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: MainRoutes.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          StockViewRoute.name,
          path: '/stock-view-page',
        ),
        _i11.RouteConfig(
          GreetingWelcomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          AuthRoute.name,
          path: '/auth-page',
        ),
        _i11.RouteConfig(
          PinEnterRoute.name,
          path: '/pin-enter-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPages]
class MainRoutes extends _i11.PageRouteInfo<void> {
  const MainRoutes({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoutes.name,
          path: '/main-pages',
          initialChildren: children,
        );

  static const String name = 'MainRoutes';
}

/// generated route for
/// [_i2.StockViewPage]
class StockViewRoute extends _i11.PageRouteInfo<StockViewRouteArgs> {
  StockViewRoute({
    _i12.Key? key,
    required _i14.StockData stock,
  }) : super(
          StockViewRoute.name,
          path: '/stock-view-page',
          args: StockViewRouteArgs(
            key: key,
            stock: stock,
          ),
        );

  static const String name = 'StockViewRoute';
}

class StockViewRouteArgs {
  const StockViewRouteArgs({
    this.key,
    required this.stock,
  });

  final _i12.Key? key;

  final _i14.StockData stock;

  @override
  String toString() {
    return 'StockViewRouteArgs{key: $key, stock: $stock}';
  }
}

/// generated route for
/// [_i3.GreetingWelcomePage]
class GreetingWelcomeRoute extends _i11.PageRouteInfo<void> {
  const GreetingWelcomeRoute()
      : super(
          GreetingWelcomeRoute.name,
          path: '/',
        );

  static const String name = 'GreetingWelcomeRoute';
}

/// generated route for
/// [_i4.AuthPage]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth-page',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i5.PinEnterPage]
class PinEnterRoute extends _i11.PageRouteInfo<PinEnterRouteArgs> {
  PinEnterRoute({
    _i12.Key? key,
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

  final _i12.Key? key;

  final bool isRegister;

  @override
  String toString() {
    return 'PinEnterRouteArgs{key: $key, isRegister: $isRegister}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.MarketPage]
class MarketRoute extends _i11.PageRouteInfo<void> {
  const MarketRoute()
      : super(
          MarketRoute.name,
          path: 'market-page',
        );

  static const String name = 'MarketRoute';
}

/// generated route for
/// [_i8.FeedPage]
class FeedRoute extends _i11.PageRouteInfo<void> {
  const FeedRoute()
      : super(
          FeedRoute.name,
          path: 'feed-page',
        );

  static const String name = 'FeedRoute';
}

/// generated route for
/// [_i9.ChatPage]
class ChatRoute extends _i11.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: 'chat-page',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
