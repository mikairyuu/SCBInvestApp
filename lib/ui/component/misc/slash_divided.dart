import 'package:flutter/material.dart';
import 'package:scb_app/ui/theme.dart';
import 'package:scb_app/util.dart';

class SlashDivided extends StatelessWidget {
  final String firstVal;
  final String secondVal;
  final bool isPositive;
  final bool isFirstGray;
  final Color? fixedColor;
  final TextStyle textStyle;

  const SlashDivided(this.firstVal, this.secondVal,
      {super.key,
      required this.isPositive,
      required this.textStyle,
      this.fixedColor,
      this.isFirstGray = false});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: firstVal,
        style: textStyle.apply(
            color: isFirstGray
                ? context.colorScheme.tertiary
                : fixedColor ??
                    (isPositive
                        ? context.colorScheme.success
                        : context.colorScheme.error)),
        children: [
          TextSpan(
              text: " / ",
              style: textStyle.apply(color: context.colorScheme.tertiary)),
          TextSpan(
              text: secondVal,
              style: textStyle.apply(
                  color: fixedColor ??
                      (isPositive
                          ? context.colorScheme.success
                          : context.colorScheme.error)))
        ]));
  }
}
