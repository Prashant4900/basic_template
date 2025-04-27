part of 'setting_cubit.dart';

enum SettingStatus { initial, loading, success, error }

class SettingState extends Equatable {
  const SettingState({
    required this.isDynamicColor,
    required this.local,
    required this.status,
    required this.themeMode,
    required this.dynamicColor,
  });

  factory SettingState.initial() => SettingState(
    local: AppPrefHelper.getLanguage(),
    status: SettingStatus.initial,
    themeMode: AppPrefHelper.getThemeMode(),
    isDynamicColor: AppPrefHelper.getIsDynamicColor(),
    dynamicColor:
        AppPrefHelper.getDynamicColor() == 0
            ? colorPalette[0]
            : AppPrefHelper.getDynamicColor().toARGB32(),
  );

  final String local;
  final SettingStatus status;
  final ThemeMode themeMode;
  final bool isDynamicColor;
  final Color dynamicColor;

  SettingState copyWith({
    String? local,
    SettingStatus? status,
    ThemeMode? themeMode,
    bool? isDynamicColor,
    Color? dynamicColor,
  }) {
    return SettingState(
      local: local ?? this.local,
      themeMode: themeMode ?? this.themeMode,
      status: status ?? this.status,
      isDynamicColor: isDynamicColor ?? this.isDynamicColor,
      dynamicColor: dynamicColor ?? this.dynamicColor,
    );
  }

  @override
  List<Object?> get props => [
    local,
    status,
    themeMode,
    isDynamicColor,
    dynamicColor,
  ];
}
