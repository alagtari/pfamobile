part of 'language_bloc.dart';

// @freezed
abstract class LanguageEvent {
  const LanguageEvent();
}

class LoadLanguageEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  ChangeLanguageEvent(this.locale);
  final Locale locale;
}
