import 'package:auto_route/auto_route.dart';
import 'package:scb_app/ui/pages/greeting/greeting_welcome.dart';
import 'package:scb_app/ui/pages/auth/auth_page.dart';
import 'package:scb_app/ui/pages/home/home_page.dart';
import 'package:scb_app/ui/pages/main_pages_page.dart';
import 'package:scb_app/ui/pages/pin/pin_enter_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: MainPages,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        children: [
          CustomRoute(page: HomePage),
        ]),
    CustomRoute(
        page: GreetingWelcomePage,
        initial: true,
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
