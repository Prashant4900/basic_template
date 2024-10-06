import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  final baseTheme = ThemeData(brightness: Brightness.light);

  return ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    textTheme: GoogleFonts.notoSerifTextTheme(baseTheme.textTheme),
    appBarTheme: AppBarTheme(
      foregroundColor: Theme.of(context).colorScheme.primary,
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  final baseTheme = ThemeData(brightness: Brightness.dark);

  return ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    textTheme: GoogleFonts.notoSerifTextTheme(baseTheme.textTheme),
  );
}
