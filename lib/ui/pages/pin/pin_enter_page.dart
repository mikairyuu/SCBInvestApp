import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/pages/pin/pin_enter_notifier.dart';
import 'package:scb_app/util.dart';

class PinEnterPage extends ConsumerWidget {
  final bool isRegister;
  const PinEnterPage({super.key, required this.isRegister});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pinLength = ref.watch(enteredPinProvider).length;
    var step = ref.watch(pinEnterStepProvider);
    var notifier = ref.watch(pinEnterNotifierProvider(isRegister).notifier);
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 95, 0, 0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          isRegister
                              ? step == 0
                                  ? "Придумайте пин-код \nдля входа в приложение"
                                  : "Введите пин-код ещё раз"
                              : "Введите пин-код",
                          style: context.textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ShakeWidget(
                            autoPlay: ref.watch(pinEnterShakeProvider),
                            shakeConstant: ShakeDefaultConstant1(),
                            child: Wrap(
                              spacing: 16,
                              children: [
                                for (var i = 0; i < 4; i++)
                                  AnimatedContainer(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          gradient: pinLength > i
                                              ? const LinearGradient(colors: [
                                                  Color(0xFFFC5055),
                                                  Color(0xFFEDA1A3)
                                                ])
                                              : null,
                                          color: context.colorScheme.outline,
                                          shape: BoxShape.circle),
                                      duration:
                                          const Duration(milliseconds: 100)),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: PinKeyboard(onTap: (c) {
                            notifier.onPinEntered(c);
                          })))
                ],
              ))),
    );
  }
}

class PinKeyboard extends ConsumerWidget {
  final void Function(int) onTap;

  const PinKeyboard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var i = 0; i < 4; i++)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var j = 0; j < 3; j++)
              i * 3 + j != 9
                  ? Material(
                      color: Colors.white,
                      child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            HapticFeedback.lightImpact();
                            onTap(i * 3 + j + 1);
                          },
                          splashColor: context.colorScheme.outline,
                          child: Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              alignment: Alignment.center,
                              width: 70,
                              height: 60,
                              child: i * 3 + j != 11
                                  ? Text(
                                      "${i * 3 + j != 10 ? i * 3 + j + 1 : 0}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25),
                                    )
                                  : SvgPicture.asset(
                                      "$drawableFolder/ic_arrow_back.svg"))))
                  : const SizedBox(
                      width: 70,
                      height: 70,
                    ),
          ],
        )
    ]);
  }
}
