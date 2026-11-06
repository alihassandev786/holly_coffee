import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
mixin SharedPref {
  static const String _themeKey = "apptheme";
  static final ValueNotifier <ThemeMode> themeNotifier = 
  ValueNotifier<ThemeMode>(ThemeMode.system);
  static Future<void> loadthememode()async{
    final pref = await SharedPreferences.getInstance();
    final savedmode = pref.getString(_themeKey);
    themeNotifier.value = ThemeMode.values.firstWhere(
      (mode) => mode.name == savedmode,
      orElse: ()=>ThemeMode.system
    );
  }
  static Future<void> setThemeMode(ThemeMode mode)async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_themeKey, mode.name);
    themeNotifier.value=mode;
  }
}