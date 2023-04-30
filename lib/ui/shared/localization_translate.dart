import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

//https://medium.com/@lumeilin301/multi-language-in-flutter-ee393b298ec5
//https://pub.dev/packages/localization

class LocalizationTranslate {
  final Locale locale;
  late Map<String, List<dynamic>> _localizedStrings = {};

  LocalizationTranslate(
      {this.locale = const Locale.fromSubtags(languageCode: 'es')});

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static LocalizationTranslate? of(BuildContext context) {
    return Localizations.of<LocalizationTranslate>(
        context, LocalizationTranslate);
  }

  //store SharedPreferences
  void keepLocaleKey(String localeKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("localeKey");
    await prefs.setString("LocaleKey", localeKey);
  }

  //red SharedPreferences
  Future<String> readLocaleKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("localeKey") ?? 'es';
  }

  void setLocale(BuildContext context, Locale locale) async {
    keepLocaleKey(locale.languageCode);
    // print("key language : ${locale.languageCode}");
    MyApp.setLocale(context, locale);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<LocalizationTranslate> delegate =
      _LocalizationTranslateDelegate();

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle
        .loadString('language/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));
    return true;
  }

  // This method will be called from every widget which needs a localized text
  List<dynamic> translate(String key) {
    return _localizedStrings[key]!;
  }
}

class _LocalizationTranslateDelegate
    extends LocalizationsDelegate<LocalizationTranslate> {
  // This delegate instance will never change
  // It can provide a constant constructor.
  const _LocalizationTranslateDelegate();
  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es'].contains(locale.languageCode);
  }

  /// read Json
  @override
  Future<LocalizationTranslate> load(Locale locale) async {
    // MultiLanguages class is where the JSON loading actually runs
    LocalizationTranslate localization = LocalizationTranslate(locale: locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_LocalizationTranslateDelegate old) => false;
}
