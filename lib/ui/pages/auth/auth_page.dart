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
    final loginText = ref.watch(loginTextProvider);
    final uiState = ref.watch(authStateNotifierProvider);

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 66, 50, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Вход в приложение",
                        style: context.textTheme.headline1,
                      ),
                      const SizedBox(height: 11),
                      Text(
                        "Введите номер телефона, чтобы \nвойти или стать нашим клиентом ",
                        style: context.textTheme.bodyText1,
                      ),
                      const SizedBox(height: 29),
                      if (uiState.isError)
                        Text(
                            uiState.error is AuthUIError
                                ? (uiState.error as AuthUIError).description
                                : AuthUIError.wrongCreds.description,
                            style: context.textTheme.bodyText1!
                                .apply(color: Colors.red)),
                      if (uiState.isError) const SizedBox(height: 30),
                      CommonTextField(
                        keyboardType: TextInputType.number,
                        numberPrefix: true,
                        onChanged: (s) =>
                            ref.read(loginTextProvider.notifier).state = s,
                        error: loginText.isEmpty &&
                            uiState.error == AuthUIError.unfilled,
                      ),
                      const SizedBox(height: 21),
                      CommonButton(
                        onTap: () => {
                          context.router
                              .navigate(PinEnterRoute(isRegister: true))
                        },
                        text: "Продолжить",
                      )
                    ]))));
  }
}
