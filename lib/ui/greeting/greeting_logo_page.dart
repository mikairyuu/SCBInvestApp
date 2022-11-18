import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';

class GreetingLogoPage extends ConsumerWidget {
  const GreetingLogoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () => context.router.navigate(const GreetingWelcomeRoute()),
        child: Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 172, 0, 46),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          "$drawableFolder/scb_logo.png",
                          width: 242,
                          height: 204,
                        ),
                        const Spacer(),
                        const Text(
                          "Инвестируй по новому",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )))));
  }
}
