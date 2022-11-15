import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/core/ui_state.dart';
import 'package:scb_app/ui/component/button/common_button.dart';
import 'package:scb_app/ui/component/input/common_field.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';
import 'package:scb_app/util.dart';

import 'auth_state_notifier.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(isAuthStateProvider);
    final loginText = ref.watch(loginTextProvider);
    final pwdText = ref.watch(pwdTextProvider);
    final pwdConfText = ref.watch(pwdConfTextProvider);
    final authStateNotifier = ref.watch(authStateNotifierProvider.notifier);
    final uiState = ref.watch(authStateNotifierProvider);

    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
            child: CommonButton(
                loading: uiState.isLoading,
                onTap: () {
                  context.router.replace(const MainRoutes());
                  // if (isAuth) {
                  //   authStateNotifier.login();
                  // } else {
                  //   authStateNotifier.register();
                  // }
                },
                centerText: true,
                text: isAuth ? "Войти" : "Зарегистрироваться")),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isAuth ? "Авторизация" : "Регистрация",
                        style: context.textTheme.headline2,
                      ),
                      const SizedBox(height: 30),
                      if (uiState.isError)
                        Text(
                            uiState.error is AuthUIError
                                ? (uiState.error as AuthUIError).description
                                : AuthUIError.wrongCreds.description,
                            style: context.textTheme.bodyText1!
                                .apply(color: Colors.red)),
                      if (uiState.isError) const SizedBox(height: 30),
                      CommonTextField(
                        hintText: "Логин",
                        onChanged: (s) =>
                            ref.read(loginTextProvider.notifier).state = s,
                        error: loginText.isEmpty &&
                            uiState.error == AuthUIError.unfilled,
                      ),
                      const SizedBox(height: 30),
                      CommonTextField(
                        hintText: "Пароль",
                        obscureText: true,
                        onChanged: (s) =>
                            ref.read(pwdTextProvider.notifier).state = s,
                        error: pwdText.isEmpty &&
                            uiState.error == AuthUIError.unfilled,
                      ),
                      const SizedBox(height: 30),
                      if (!isAuth)
                        CommonTextField(
                          hintText: "Повтор пароля",
                          obscureText: true,
                          onChanged: (s) =>
                              ref.read(pwdConfTextProvider.notifier).state = s,
                          error: pwdConfText.isEmpty &&
                              uiState.error == AuthUIError.unfilled,
                        ),
                      if (!isAuth) const SizedBox(height: 30),
                      GestureDetector(
                          onTap: () {
                            authStateNotifier.toggleAuth();
                          },
                          child: Text(
                            isAuth
                                ? "Нет аккаунта? Зарегистрируйтесь"
                                : "Уже есть аккаунт?",
                            style: TextStyle(
                                color: context.colorScheme.secondary,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ))
                    ]))));
  }
}
