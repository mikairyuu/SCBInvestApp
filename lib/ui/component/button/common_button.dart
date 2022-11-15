import 'package:flutter/material.dart';
import 'package:scb_app/util.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;

  final String text;

  final Color? color;

  final bool arrow;

  final bool centerText;

  final bool loading;

  final bool enabled;

  const CommonButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.enabled = true,
      this.loading = false,
      this.color,
      this.arrow = true,
      this.centerText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: loading
              ? context.colorScheme.primaryContainer
              : (enabled
                  ? color ?? context.colorScheme.primary
                  : context.colorScheme.secondaryContainer),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : InkWell(
                  onTap: onTap,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          mainAxisAlignment: centerText
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            Text(text,
                                style: context.textTheme.headline2!.apply(
                                    color: context.colorScheme.onPrimary)),
                          ])),
                ),
        ));
  }
}
