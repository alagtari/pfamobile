import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  final SharedPreferences prefs;

  AppPrefs(this.prefs);

  String? getToken() => prefs.getString(_token);
  String? getRole() => prefs.getString(_role);
  String? getAppLanguage() => prefs.getString(_appLanguage);

  Future<void> saveToken(String token) => prefs.setString(_token, token);
  Future<void> saveRole(String role) => prefs.setString(_role, role);
  Future<void> saveAppLanguage({
    required String language,
  }) =>
      prefs.setString(
        _appLanguage,
        language,
      );
  Future<void> clearAll() async {
    prefs.clear();
  }

  static const _token = "token";
  static const _role = "role";
  static const _appLanguage = "lang";

}
