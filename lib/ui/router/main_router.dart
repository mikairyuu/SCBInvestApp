import 'package:auto_route/auto_route.dart';
import 'package:scb_app/ui/pages/auth/auth_page.dart';
import 'package:scb_app/ui/pages/home/home_page.dart';
import 'package:scb_app/ui/pages/main_pages_page.dart';

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
        page: AuthPage,
        initial: true,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
  ],
)
// extend the generated private router
class $MainRouter {}
