import 'package:buenro_hotels/common/res/strings.dart';
import 'package:flutter/material.dart';

class AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  final String languageCode;

  AppStringsDelegate(this.languageCode);

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  Future<AppStrings> load(Locale locale) => AppStrings.load(languageCode);

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
