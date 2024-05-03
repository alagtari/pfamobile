import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  final SharedPreferences prefs;

  AppPrefs(this.prefs);

  String? getToken() => prefs.getString(_token);
  String? getPrenom() => prefs.getString(_prenom);
  int? getClasseId() => prefs.getInt(_classeId);
  int? getId() => prefs.getInt(_id);
  int? getOrganisationId() => prefs.getInt(_organisationId);

  Future<void> saveToken(String token) => prefs.setString(_token, token);
  Future<void> saveId(int id) => prefs.setInt(_id, id);
  Future<void> saveCalsseId(int classeId) => prefs.setInt(_classeId, classeId);
  Future<void> savePrenom(String prenom) => prefs.setString(_prenom, prenom);
  Future<void> saveOrganizationId(int organisationId) => prefs.setInt(_organisationId, organisationId);

  Future<void> clearAll() async {
    prefs.clear();
  }

  static const _token = "user_token";
  static const _id = "user_id";
  static const _organisationId = "organisation_id";
  static const _classeId = "classe_id";
  static const _prenom = "prenom";
}
