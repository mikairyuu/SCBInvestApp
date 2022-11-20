import 'package:auto_route/auto_route.dart';
import 'package:scb_app/ui/pages/greeting/greeting_welcome.dart';
import 'package:scb_app/ui/pages/auth/auth_page.dart';
import 'package:scb_app/ui/pages/main/chat/chat_page.dart';
import 'package:scb_app/ui/pages/main/feed/feed_page.dart';
import 'package:scb_app/ui/pages/main/home/home_page.dart';
import 'package:scb_app/ui/pages/main/market/market_page.dart';
import 'package:scb_app/ui/pages/main/market/stock_view_page.dart';
import 'package:scb_app/ui/pages/main/profile/profile_page.dart';
import 'package:scb_app/ui/pages/main_pages_page.dart';
import 'package:scb_app/ui/pages/pin/pin_enter_page.dart';
import 'package:scb_app/ui/router/auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: MainPages,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        children: [
          CustomRoute(page: HomePage),
          CustomRoute(page: MarketPage),
          CustomRoute(page: FeedPage),
          CustomRoute(page: ChatPage),
          CustomRoute(page: ProfilePage),
        ]),
    CustomRoute(page: StockViewPage),
    CustomRoute(
        page: GreetingWelcomePage,
        initial: true,
        guards: [AuthGuard],
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
    CustomRoute(
        page: AuthPage,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
    CustomRoute(
        page: PinEnterPage,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
  ],
)
// extend the generated private router
class $MainRouter {}
