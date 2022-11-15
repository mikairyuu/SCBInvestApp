import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/services/http/http_client.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    var token = await ref.read(tokenProvider.future);
    if (token != null) {
      router.navigate(const MainRoutes());
    } else {
      resolver.next(true);
    }
  }
}
