import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  final SharedPreferences prefs;
  static StreamController<String> _languageController =
      StreamController.broadcast();

  static Stream<String> get languageStream => _languageController.stream;

  AppPrefs(this.prefs);

  String? getToken() => prefs.getString(_token);
  String? getRole() => prefs.getString(_role);
  String? getAppLanguage() => prefs.getString(_appLanguage);

  Future<void> saveToken(String token) => prefs.setString(_token, token);
  Future<void> saveRole(String role) => prefs.setString(_role, role);
  Future<void> saveAppLanguage({
    required String language,
  }) async {
    prefs.setString(
      _appLanguage,
      language,
    );
    _languageController.add(language);
  }

  Future<void> clearAll() async {
    prefs.clear();
  }

  static void dispose() {
    _languageController.close();
  }

  static const _token = "token";
  static const _role = "role";
  static const _appLanguage = "lang";
}
