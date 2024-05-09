
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/main.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final defaultLang = const Locale("fr");
  LanguageBloc()
      : super(
          LanguageState(
            
              Locale(MyApp.supportedLocales.first.languageCode)),
        ) {
    on<LoadLanguageEvent>(
      (event, emit) async {
          emit(LanguageState(defaultLang));
          initializeDateFormatting('fr', null);
      },
    );
    on<ChangeLanguageEvent>(
      (event, emit) async {
                await GetIt.I<AppPrefs>().saveAppLanguage(
          language: event.locale.languageCode,
        );
        emit(LanguageState(event.locale));
        initializeDateFormatting(
          event.locale.languageCode,
          null,
        );
      },
    );
  }
}

extension BuildContextX on BuildContext {
  Locale get locale => read<LanguageBloc>().state.locale;
}
