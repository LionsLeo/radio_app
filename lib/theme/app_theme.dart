import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode get themeMode => ThemeMode.dark;

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff1F1F27),
      primaryColor: const Color(0xff282830),
      secondaryHeaderColor: const Color(0xff71747D),
      dividerColor: const Color(0xff6E2B3D));
}
