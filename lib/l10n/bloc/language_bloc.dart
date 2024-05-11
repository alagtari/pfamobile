import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/injection/injection_container.dart';

part 'language_event.dart';
part 'language_state.dart';

const languagePrefsKey = 'languagePrefs';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final _prefs = sl<AppPrefs>();
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(_onChangeLanguage);
    on<GetLanguage>(_onGetLanguage);
  }

  void _onChangeLanguage(
      ChangeLanguage event, Emitter<LanguageState> emit) async {
    await _prefs.saveAppLanguage(language: event.selectedLanguage);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  void _onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    final selectedLanguage = _prefs.getAppLanguage();
    log("message : $selectedLanguage");
    emit(state.copyWith(
      selectedLanguage: selectedLanguage ?? "en",
    ));
  }
}
