import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/core/base_notifier.dart';
import 'package:scb_app/core/ui_state.dart';
import 'package:scb_app/main.dart';
import 'package:scb_app/services/storage/secure_storage_service.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';

final enteredPinProvider = StateProvider.autoDispose((ref) => "");

final pinEnterNotifierProvider = StateNotifierProvider.autoDispose
    .family<PinEnterNotifier, UIState, bool>(
        (ref, isRegister) => PinEnterNotifier(ref, isRegister));

final pinEnterStepProvider = StateProvider.autoDispose((ref) => 0);

final pinEnterShakeProvider = StateProvider.autoDispose((ref) => false);

class PinEnterNotifier extends BaseNotifier {
  bool isRegister;

  PinEnterNotifier(super.ref, this.isRegister);

  String firstStepPin = '';

  Future<void> onPinEntered(int pinIndex) async {
    var char = pinIndex.toString();
    var curPin = ref.read(enteredPinProvider);
    if (pinIndex == 11) char = '0';
    if (pinIndex == 12) {
      if (curPin.isEmpty) return;
      ref.read(enteredPinProvider.notifier).state =
          curPin.substring(0, curPin.length - 1);
    } else {
      if (curPin.length == 4) return;
      ref.read(enteredPinProvider.notifier).state += char;
      if (curPin.length == 3) {
        if (ref.read(pinEnterStepProvider) == 0) {
          if (isRegister) {
            await Future.delayed(const Duration(milliseconds: 100));
            firstStepPin = ref.read(enteredPinProvider);
            ref.read(enteredPinProvider.notifier).state = '';
            ref.read(pinEnterStepProvider.notifier).state = 1;
          } else {
            var pin = await ref.read(secureStorageProvider).getString("pin");
            if (pin == ref.read(enteredPinProvider)) {
              ref.read(routerProvider).navigate(const HomeRoute());
            } else {
              _shakeReset();
            }
          }
        } else {
          if (firstStepPin == ref.read(enteredPinProvider)) {
            ref.read(secureStorageProvider).setString("pin", firstStepPin);
            ref.read(routerProvider).navigate(const MainRoutes());
          } else {
            _shakeReset();
          }
        }
      }
    }
  }

  void _shakeReset() async {
    ref.read(pinEnterShakeProvider.notifier).state = true;
    await Future.delayed(const Duration(milliseconds: 500));
    ref.read(pinEnterShakeProvider.notifier).state = false;
    ref.read(pinEnterStepProvider.notifier).state = 0;
    ref.read(enteredPinProvider.notifier).state = '';
  }
}
