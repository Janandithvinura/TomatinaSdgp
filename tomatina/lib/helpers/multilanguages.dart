import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiLanguages {
  final Locale locale;

  MultiLanguages(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static MultiLanguages? of(BuildContext context) {
    return Localizations.of<MultiLanguages>(context, MultiLanguages);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<MultiLanguages> delegate =
      MultiLanguagesDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key]!;
  }
}

class MultiLanguagesDelegate extends LocalizationsDelegate<MultiLanguages> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const MultiLanguagesDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'si'].contains(locale.languageCode);
  }

  @override
  Future<MultiLanguages> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    MultiLanguages localizations = MultiLanguages(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(MultiLanguagesDelegate old) => false;
}
