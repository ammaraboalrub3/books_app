import 'package:flutter/material.dart';

class AppController {
  static final ValueNotifier<Locale> locale = ValueNotifier(const Locale('en'));
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.dark,
  );

  static void toggleLocale() {
    bool isAr = locale.value.languageCode == 'ar';
    locale.value = isAr ? const Locale('en') : const Locale('ar');
  }

  static void toggleThemeMode() {
    themeMode.value = themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
