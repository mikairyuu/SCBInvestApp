import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/core/base_notifier.dart';
import 'package:scb_app/core/ui_state.dart';
import 'package:scb_app/main.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';

final authShakeProvider = StateProvider.autoDispose((ref) => false);

final phoneProvider = StateProvider((ref) => '');

final authStateNotifierProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, UIState>(
        (ref) => AuthStateNotifier(ref));

class AuthStateNotifier extends BaseNotifier {
  AuthStateNotifier(Ref ref) : super(ref);

  void check() {
    if (ref.read(phoneProvider).length < 10) {
      _shake();
      state = const UIState.error('Номер телефона введен неверно');
    } else {
      ref.read(routerProvider).navigate(PinEnterRoute(isRegister: true));
    }
  }

  void _shake() async {
    ref.read(authShakeProvider.notifier).state = true;
    await Future.delayed(const Duration(milliseconds: 500));
    ref.read(authShakeProvider.notifier).state = false;
  }
}
