import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static const String _kIsLoggedIn = 'is_logged_in';

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) =>
      _instance.setBool(key, value);

  static bool getBool(String key, {bool defaultValue = false}) =>
      _instance.getBool(key) ?? defaultValue;

  static Future<bool> setString(String key, String value) =>
      _instance.setString(key, value);

  static String? getString(String key) => _instance.getString(key);

  static Future<bool> setInt(String key, int value) =>
      _instance.setInt(key, value);

  static int? getInt(String key) => _instance.getInt(key);

  static Future<bool> remove(String key) => _instance.remove(key);

  static Future<bool> clear() => _instance.clear();

  // User Login Helpers
  static Future<bool> setIsLoggedIn(bool value) => setBool(_kIsLoggedIn, value);

  static bool get isLoggedIn => getBool(_kIsLoggedIn);
}
