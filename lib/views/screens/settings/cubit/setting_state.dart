part of 'setting_cubit.dart';

enum SettingStatus { initial, loading, success, error }

class SettingState extends Equatable {
  const SettingState({
    required this.local,
    required this.status,
    required this.themeMode,
  });

  factory SettingState.initial() => SettingState(
    local: AppPrefHelper.getLanguage(),
    status: SettingStatus.initial,
    themeMode: AppPrefHelper.getThemeMode(),
  );

  final String local;
  final SettingStatus status;
  final ThemeMode themeMode;

  SettingState copyWith({
    String? local,
    SettingStatus? status,
    ThemeMode? themeMode,
  }) {
    return SettingState(
      local: local ?? this.local,
      themeMode: themeMode ?? this.themeMode,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [local, status, themeMode];
}
