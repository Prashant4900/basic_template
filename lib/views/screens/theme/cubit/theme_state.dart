part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  const ThemeChanged(this.themeMode);
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}
