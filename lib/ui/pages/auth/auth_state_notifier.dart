import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/core/base_notifier.dart';
import 'package:scb_app/core/ui_state.dart';
import 'package:scb_app/domain/entity/request/auth_request.dart';
import 'package:scb_app/domain/repository/auth_repository.dart';
import 'package:scb_app/main.dart';
import 'package:scb_app/services/http/http_client.dart';
import 'package:scb_app/services/storage/secure_storage_service.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';

final isAuthStateProvider = StateProvider((ref) => false);

final loginTextProvider = StateProvider((ref) => "");

final pwdTextProvider = StateProvider((ref) => "");

final pwdConfTextProvider = StateProvider((ref) => "");

final authStateNotifierProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, UIState>(
        (ref) => AuthStateNotifier(ref.watch(authRepositoryProvider), ref));

enum AuthUIError {
  unfilled("Все поля должны быть заполнены"),
  wrongCreds("Неверный логин/пароль. Повторите попытку :(");

  const AuthUIError(this.description);
  final String description;
}

class AuthStateNotifier extends BaseNotifier {
  final AuthRepository authRepository;

  AuthStateNotifier(this.authRepository, Ref ref) : super(ref);

  void login() async {
    if (!check()) return;
    var res = await request(() {
      return authRepository.login(AuthRequest(
          username: ref.read(loginTextProvider).trim(),
          password: ref.read(pwdTextProvider)));
    });
    await onResult(res);
  }

  void register() async {
    if (!check()) return;
    var res = await request(() {
      return authRepository.register(AuthRequest(
          username: ref.read(loginTextProvider).trim(),
          password: ref.read(pwdTextProvider)));
    });
    await onResult(res);
  }

  void toggleAuth() {
    if (state.isLoading) return;
    ref.read(isAuthStateProvider.notifier).state =
        !ref.read(isAuthStateProvider.notifier).state;
    state = const UIState.initial();
  }

  bool check() {
    var isError = ref.read(loginTextProvider).isEmpty ||
        ref.read(pwdTextProvider).isEmpty ||
        (!ref.read(isAuthStateProvider) &&
            ref.read(pwdConfTextProvider).isEmpty);
    if (isError) state = const UIState.error(AuthUIError.unfilled);
    return !isError;
  }

  Future<void> onResult(UIState<dynamic> res) async {
    if (res.isError) {
      state = const UIState.error(AuthUIError.wrongCreds);
    } else if (res.isSuccess) {
      await ref
          .read(secureStorageProvider)
          .setString(keyToken, res.data as String);
      ref.invalidate(tokenProvider);
      // ref.read(routerProvider).replace(const MainRoutes());
    }
  }
}
