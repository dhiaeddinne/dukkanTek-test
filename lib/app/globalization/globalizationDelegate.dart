import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'globalizationManager.dart';

class GlobalizationDelegate
    extends LocalizationsDelegate<GlobalizationManager> {
  const GlobalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'ar'].contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<GlobalizationManager> old) => false;

  @override
  Future<GlobalizationManager> load(Locale locale) {
    if (isSupported(locale)) {
      return SynchronousFuture<GlobalizationManager>(
          GlobalizationManager(locale));
    } else {
      return SynchronousFuture<GlobalizationManager>(
          GlobalizationManager(Locale('en')));
    }
  }
}
