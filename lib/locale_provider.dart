import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('vi');

  Locale get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString('languageCode') ?? 'vi';

    _locale = Locale(languageCode);

    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    if (!['vi', 'en'].contains(locale.languageCode)) return;

    if (_locale.languageCode == locale.languageCode) return;

    _locale = locale;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('languageCode', locale.languageCode);

    notifyListeners();
  }
}
