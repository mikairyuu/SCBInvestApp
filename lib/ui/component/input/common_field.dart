import 'package:flutter/material.dart';
import 'package:scb_app/util.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;

  final bool obscureText;

  final bool error;

  final void Function(String) onChanged;

  const CommonTextField(
      {super.key,
      this.hintText = "",
      this.obscureText = false,
      this.error = false,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: TextField(
          onChanged: onChanged,
          obscureText: obscureText,
          autocorrect: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            filled: true,
            fillColor: context.colorScheme.secondaryContainer,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: hintText,
            hintStyle: context.textTheme.headline2!.apply(
                color: error ? Colors.red : context.colorScheme.secondary),
          ),
        ));
  }
}
