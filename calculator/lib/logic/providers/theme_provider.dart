import 'package:calculator/logic/providers/theme_preference.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _isDark;
  bool get isDark => _isDark;

  ThemeProvider() {
    //todo: remove this field and create splash screen for loading theme
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  ThemePreferences _preferences = ThemePreferences();

  void getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
