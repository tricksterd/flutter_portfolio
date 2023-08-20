import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const themePrefKey = 'theme_pref_key';

  void setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themePrefKey, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themePrefKey) ?? false;
  }
}
