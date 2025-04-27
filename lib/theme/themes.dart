import 'package:appwrite_app/core/extensions.dart';
import 'package:appwrite_app/utility/app_prefs.dart';
import 'package:flutter/material.dart';

List<Color> colorPalette = [
  const Color(0xFFA0C878),
  const Color(0xFFA1E3F9),
  const Color(0xFFBF3131),
  const Color(0xFF693382),
  const Color(0xFFFFB200),
  const Color(0xFF336D82),
  const Color(0xFFEC7FA9),
  const Color(0xFF205781),
  const Color(0xFF98D8EF),
  const Color(0xFFFBF3B9),
];

ThemeData lightTheme(BuildContext context) {
  final seedColor =
      AppPrefHelper.getIsDynamicColor()
          ? (AppPrefHelper.getDynamicColor() == 0
              ? colorPalette[0]
              : AppPrefHelper.getDynamicColor().toARGB32())
          : Colors.white;

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStateProperty.all(Colors.black),
      trackOutlineColor: WidgetStateProperty.all(Colors.black),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  final seedColor =
      AppPrefHelper.getIsDynamicColor()
          ? (AppPrefHelper.getDynamicColor() == 0
              ? colorPalette[0]
              : AppPrefHelper.getDynamicColor().toARGB32())
          : Colors.white;

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.black),
      trackColor: WidgetStateProperty.all(Colors.white),
      trackOutlineColor: WidgetStateProperty.all(Colors.white),
    ),
  );
}
