import 'package:flutter/material.dart';
import 'package:scb_app/constants.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

commonLog(String message) {
  if (isDebug) debugPrint(message);
}

getNounPluralForm(int n, String first, String second, String third) {
  if (n % 10 == 1 && n % 100 != 11) {
    return first;
  } else if (n % 10 >= 2 && n % 10 <= 4 && (n % 100 < 10 || n % 100 >= 20)) {
    return second;
  } else {
    return third;
  }
}
