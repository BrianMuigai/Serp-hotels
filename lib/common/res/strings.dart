import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStrings {
  final Map<String, String> _localizedStrings;

  AppStrings(this._localizedStrings);

  String translate(String key) => _localizedStrings[key] ?? key;

  static Future<AppStrings> load(String languageCode) async {
    final String jsonString =
        await rootBundle.loadString('assets/lang/$languageCode.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    return AppStrings(
        jsonMap.map((key, value) => MapEntry(key, value.toString())));
  }

  static String getString(BuildContext context, String str) {
    final strings = Localizations.of<AppStrings>(context, AppStrings);
    return strings?.translate(str) ?? str;
  }
}
