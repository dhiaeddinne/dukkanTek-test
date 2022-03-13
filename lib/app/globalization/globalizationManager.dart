import 'package:dukkan_tekk_test/app/globalization/en.dart';
import 'package:dukkan_tekk_test/app/globalization/fr.dart';
import 'package:flutter/material.dart';

import 'ar.dart';

class GlobalizationManager {
  GlobalizationManager(this.locale);

  Locale locale;

  static GlobalizationManager of(BuildContext context) {
    return Localizations.of(context, GlobalizationManager);
  }

  static Map<String, Map<String, Map<String, String>>> _localizedValues = {
    'en': EnMessages.messages,
    'fr': FrMessages.messages,
    'ar': ArMessages.messages,
  };

  String getMessage(String key1, String key2) {
    return _localizedValues[locale.languageCode]?[key1]?[key2] ??
        "$key1.$key2 not found";
  }

  static Future<GlobalizationManager> load(Locale locale) async {
    GlobalizationManager translations = new GlobalizationManager(locale);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}
