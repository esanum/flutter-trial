import 'dart:convert';
import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:flutter_starter/core/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  //
  static SharedPreferences preferences;
  static const String KEY_SELECTED_THEME = 'key_selected_theme';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveTheme(AppTheme selectedTheme) async {
    if (null == selectedTheme) {
      selectedTheme = AppTheme.lightTheme;
    }
    String theme = jsonEncode(selectedTheme.toString());
    preferences.setString(KEY_SELECTED_THEME, theme);
  }

  static AppTheme getTheme() {
    String theme = preferences.getString(KEY_SELECTED_THEME);
    if (null == theme) {
      var brightness = SchedulerBinding.instance.window.platformBrightness; // system theme
      return brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
    }
    return getThemeFromString(jsonDecode(theme));
  }

  static AppTheme getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }
}
