import 'package:appwrite_app/core/extensions.dart';
import 'package:appwrite_app/theme/themes.dart';
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

  Future<void> toggleDynamicColor({required bool isDyanmicColor}) async {
    await AppPrefHelper.setIsDynamicColor(isDynamicColor: isDyanmicColor);
    emit(state.copyWith(isDynamicColor: isDyanmicColor));
  }

  Future<void> updateDyanmicColor(Color color) async {
    await AppPrefHelper.setDynamicColor(dynamicColor: color.toARGB32());
    emit(state.copyWith(dynamicColor: color));
  }
}
