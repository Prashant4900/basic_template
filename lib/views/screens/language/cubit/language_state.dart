part of 'language_cubit.dart';

sealed class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

final class LanguageInitial extends LanguageState {}

class LanguageChanged extends LanguageState {
  const LanguageChanged(this.locale);
  final Locale locale;

  @override
  List<Object> get props => [locale];
}
