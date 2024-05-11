part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({
    String? selectedLanguage,
  }) : selectedLanguage = selectedLanguage ?? "en";

  final String selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];

  LanguageState copyWith({String? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}