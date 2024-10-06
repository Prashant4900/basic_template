import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  final baseTheme = ThemeData(brightness: Brightness.light);

  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: GoogleFonts.notoSerifTextTheme(baseTheme.textTheme),
    appBarTheme: AppBarTheme(
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  final baseTheme = ThemeData(brightness: Brightness.dark);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.notoSerifTextTheme(baseTheme.textTheme),
  );
}
