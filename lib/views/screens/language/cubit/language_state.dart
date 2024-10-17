part of 'language_cubit.dart';

class LanguageState extends Equatable {
  const LanguageState(this.locale);

  factory LanguageState.initial() => const LanguageState(Locale('en'));

  final Locale locale;

  @override
  List<Object> get props => [locale];
}
