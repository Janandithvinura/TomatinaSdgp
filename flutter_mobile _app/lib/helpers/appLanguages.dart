import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();

    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("si")) {
      _appLocale = const Locale("si");
      await prefs.setString('language_code', 'si');
      await prefs.setString('countryCode', '');
    } else if (type == const Locale("ta")) {
      _appLocale = const Locale("ta");
      await prefs.setString('language_code', 'ta');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'us');
    }
    notifyListeners();
  }
}
