import 'package:flutter/material.dart';

var scbTheme = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              fontWeight:
                  FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.44)),
          headline2: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headline3: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          headline4: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          headline5: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          bodyText1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          bodyText2: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400))
      .apply(bodyColor: Colors.black, displayColor: Colors.black),
  primaryColor: const Color(0xFFFC5055),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
      primaryContainer: Color(0xFFF8FAF9),
      secondaryContainer: Color(0xFFEDEDED),
      secondary: Color(0xFFb1b1b1),
      tertiary: Color(0xFF939DB7),
      secondaryVariant: Color(0xFFC1C1C1),
      outline: Color(0xFFD9D9D9),
      error: Color(0xFFFC5055),
      onPrimary: Colors.white,
      primary: Color(0xFFFC5055)),
);

extension ColorExt on ColorScheme {
  Color get success => const Color(0xFF0EA943);
  Color get successContainer => const Color(0xFFE0F5E2);
  Color get barColor => const Color(0xFF6FCF97);
  Color get inactiveBar => const Color(0xFFBDBDBD);
  Color get hintColor => const Color(0xFFC0C0C0);
  Color get cardColor => const Color(0xFFEAF7FD);
}

extension TextThemeExt on TextTheme {
  TextStyle get bodyText0 =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
}
