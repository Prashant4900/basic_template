import 'package:basic_template/services/app_logger.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState.initial());

  Future<void> loadSavedLanguage() async {
    try {
      final languageCode = AppPrefHelper.getLanguage();

      emit(LanguageState(Locale(languageCode)));
      AppLogger.info('Loaded saved language: $languageCode');
    } catch (e) {
      AppLogger.error('Failed to load saved language: $e');
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    try {
      await AppPrefHelper.saveLanguage(languageCode);

      emit(LanguageState(Locale(languageCode)));
      AppLogger.info('Language changed to: $languageCode');
    } catch (e) {
      AppLogger.error('Failed to change language: $e');
    }
  }
}
