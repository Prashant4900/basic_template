import 'package:basic_template/services/app_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> loadSavedTheme() async {
    final themeMode = AppPrefHelper.getThemeMode();

    emit(ThemeChanged(themeMode));
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    await AppPrefHelper.saveThemeMode(themeMode);
    emit(ThemeChanged(themeMode));
  }
}
