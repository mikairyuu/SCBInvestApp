import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:scb_app/util.dart';

var maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

class CommonTextField extends StatelessWidget {
  final String hintText;

  final bool obscureText;

  final bool error;

  final void Function(String) onChanged;

  final TextInputType? keyboardType;

  final bool numberPrefix;

  const CommonTextField(
      {super.key,
      this.hintText = "",
      this.obscureText = false,
      this.error = false,
      this.keyboardType,
      this.numberPrefix = false,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 43,
        child: TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText,
          autocorrect: false,
          inputFormatters: numberPrefix ? [maskFormatter] : null,
          smartDashesType: SmartDashesType.enabled,
          decoration: InputDecoration(
            prefixIconConstraints: numberPrefix
                ? const BoxConstraints(minWidth: 0, minHeight: 0)
                : null,
            prefixIcon: numberPrefix
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      '+7 ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.lerp(
                              FontWeight.w600, FontWeight.w700, 0.45)),
                    ))
                : null,
            contentPadding: const EdgeInsets.only(left: 8),
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
