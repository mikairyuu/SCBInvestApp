import 'package:flutter/material.dart';

var scbTheme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headline3: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          headline4: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          headline5: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
      .apply(bodyColor: Colors.black, displayColor: Colors.black),
  primaryColor: const Color(0xFF1A76FF),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
      primaryContainer: Color(0xFFF2F1F7),
      secondaryContainer: Color(0xFFEEEEEE),
      secondary: Color(0xFF626262),
      secondaryVariant: Color(0xFFC1C1C1),
      outline: Color(0xFFD9D9D9),
      error: Color(0xFFEA3323),
      onPrimary: Colors.white,
      primary: Color(0xFF1A76FF)),
);

extension ColorExt on ColorScheme {
  Color get success => const Color(0xFFA6E9C4);
  Color get barColor => const Color(0xFF6FCF97);
  Color get inactiveBar => const Color(0xFFBDBDBD);
  Color get hintColor => const Color(0xFFC0C0C0);
  Color get cardColor => const Color(0xFFEAF7FD);
}

extension TextThemeExt on TextTheme {
  TextStyle get bodyText0 =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
}
