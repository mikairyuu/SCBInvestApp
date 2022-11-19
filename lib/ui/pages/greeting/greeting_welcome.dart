import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/component/button/common_button.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';
import 'package:scb_app/util.dart';

class GreetingWelcomePage extends ConsumerWidget {
  const GreetingWelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 66, 50, 57),
        child: Stack(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Вперёд к мечте \nвместе с Совкомбанк",
                      style: context.textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Откройте брокерский счёт и \nпогрузитесь в мир инвестиций",
                      style: context.textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Image.asset(
                      "$drawableFolder/greeting_art.png",
                    ),
                  ])),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonButton(
                    onTap: () => {context.router.navigate(const AuthRoute())},
                    text: "Открыть счёт или войти",
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Откроем брокерский счёт бесплатно",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: context.colorScheme.secondary),
                  )
                ],
              )),
        ]),
      ),
    ));
  }
}
