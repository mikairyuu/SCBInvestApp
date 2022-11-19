import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';
import 'package:scb_app/ui/theme.dart';

import '../component/scaffold/main_navbar.dart';

final scaffoldColorProvider = StateProvider((ref) {
  return scbTheme.scaffoldBackgroundColor;
});

final mainNavProvider = Provider((ref) => MainMavigationObserver(ref));

final navBarStateProvider = StateProvider((ref) => true);

class MainPages extends ConsumerWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = ref.watch(scaffoldColorProvider);
    var isNavVisible = ref.watch(navBarStateProvider);

    return SafeArea(
        child: Container(
            color: Colors.white, // needed so colors with alpha can be used
            child: Container(
                color: color,
                padding: const EdgeInsets.only(top: upperPadding),
                child: AutoTabsScaffold(
                  backgroundColor: const Color(0x00000000),
                  navigatorObservers: () => [ref.read(mainNavProvider)],
                  routes: const [
                    HomeRoute(),
                    MarketRoute(),
                    FeedRoute(),
                    ChatRoute(),
                    ProfileRoute(),
                  ],
                  bottomNavigationBuilder: isNavVisible
                      ? (context, tabsRouter) {
                          return MainNavBar(
                            onTap: tabsRouter.setActiveIndex,
                            currentIndex: tabsRouter.activeIndex,
                          );
                        }
                      : null,
                ))));
  }
}

class MainMavigationObserver extends AutoRouterObserver {
  final Ref ref;

  MainMavigationObserver(this.ref);

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    commonHandler(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    commonHandler(route, previousRoute);
  }

  void commonHandler(TabPageRoute route, TabPageRoute? previousRoute) {
    // do something on specific route changes
  }
}
