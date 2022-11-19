import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/services/storage/secure_storage_service.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    var token = await ref.read(secureStorageProvider).getString(keyPin);
    if (token != null) {
      router.navigate(PinEnterRoute(isRegister: false));
    } else {
      resolver.next(true);
    }
  }
}
