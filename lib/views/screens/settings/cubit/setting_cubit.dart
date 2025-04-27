import 'package:appwrite_app/utility/app_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  Future<void> changeLanguage(String language) async {
    await AppPrefHelper.saveLanguage(language);
    emit(state.copyWith(local: language, status: SettingStatus.success));
  }

  Future<void> changeTheme(ThemeMode theme) async {
    await AppPrefHelper.saveThemeMode(theme);
    emit(state.copyWith(themeMode: theme, status: SettingStatus.success));
  }
}
