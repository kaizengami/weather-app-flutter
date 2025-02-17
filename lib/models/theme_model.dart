import 'package:flutter/material.dart';
import 'package:weather_app/theme.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType _themeType = ThemeType.Light;

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      return notifyListeners();
    }

    if (_themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      return notifyListeners();
    }
  }

  void setThemeType(ThemeType type) {
    _themeType = type;
  }

  ThemeType getThemeType() {
    return _themeType;
  }
}
