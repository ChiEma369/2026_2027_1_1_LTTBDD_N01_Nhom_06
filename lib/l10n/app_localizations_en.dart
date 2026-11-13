// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TechTrail';

  @override
  String get home => 'Home';

  @override
  String get experience => 'Experience';

  @override
  String get journal => 'Activity Journal';

  @override
  String get profile => 'Personal Profile';

  @override
  String get accountInfo => 'Account Information';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get vietnamese => 'Vietnamese';

  @override
  String get english => 'English';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get logout => 'Log Out';

  @override
  String get updateSuccess => 'Profile updated successfully.';

  @override
  String get notUpdated => 'Not updated';

  @override
  String get accountNotFound =>
      'Account information not found.\nPlease log in again.';
}
