import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
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
    final uiState = ref.watch(authStateNotifierProvider);
    final notifier = ref.watch(authStateNotifierProvider.notifier);

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
                      ShakeWidget(
                          autoPlay: ref.watch(authShakeProvider),
                          shakeConstant: ShakeDefaultConstant1(),
                          child: CommonTextField(
                            keyboardType: TextInputType.number,
                            numberPrefix: true,
                            onChanged: (s) =>
                                ref.read(phoneProvider.notifier).state = s,
                            error: uiState.isError,
                          )),
                      const SizedBox(height: 21),
                      CommonButton(
                        onTap: () => notifier.check(),
                        text: "Продолжить",
                      )
                    ]))));
  }
}
