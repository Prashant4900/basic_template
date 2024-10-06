import 'dart:developer';

import 'package:basic_template/services/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppPrefKey {
  language('language'),
  theme('theme'),
  displayName('displayName');

  const AppPrefKey(this.name);
  final String name;
}

class AppPref {
  AppPref._();

  static SharedPreferencesWithCache? _pref;

  static Future<void> init() async {
    _pref ??= await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: AppPrefKey.values.map((e) => e.name).toSet(),
      ),
    );
  }

  static Future<bool> save(AppPrefKey key, dynamic value) async {
    log('PreferenceKey $key, Value: $value, Type: ${value.runtimeType}');

    if (value == null) return false;

    switch (value.runtimeType) {
      case String:
        await _pref!.setString(key.name, value as String);
        return true;
      case int:
        await _pref!.setInt(key.name, value as int);
        return true;
      case bool:
        await _pref!.setBool(key.name, value as bool);
        return true;
      case double:
        await _pref!.setDouble(key.name, value as double);
        return true;
      case const (List<String>):
        await _pref!.setStringList(key.name, value as List<String>);
        return true;
    }

    return false;
  }

  static dynamic get(AppPrefKey key, dynamic defaultValue) {
    final value = _pref!.get(key.name) ?? defaultValue;
    log('PreferenceKey $key Value: $value');
    return value;
  }

  static Future<void> remove(AppPrefKey key) async {
    await _pref!.remove(key.name);
  }

  static Future<void> clear() async {
    await _pref!.clear();
  }
}

class AppPrefHelper {
  static Future<bool> setDisplayName({required String displayName}) async {
    return AppPref.save(AppPrefKey.displayName, displayName);
  }

  static String getDisplayName() {
    final displayName = AppPref.get(AppPrefKey.displayName, '') as String;
    AppLogger.info('username: $displayName');
    return displayName;
  }

  static Future<bool> saveLanguage(String languageCode) async {
    return AppPref.save(AppPrefKey.language, languageCode);
  }

  static String getLanguage() {
    final language = AppPref.get(AppPrefKey.language, 'en') as String;
    AppLogger.info('language: $language');
    return language;
  }
}