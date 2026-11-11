import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In vi, this message translates to:
  /// **'TechTrail'**
  String get appTitle;

  /// No description provided for @tabCareerMap.
  ///
  /// In vi, this message translates to:
  /// **'Khám phá nghề nghiệp'**
  String get tabCareerMap;

  /// No description provided for @tabActivities.
  ///
  /// In vi, this message translates to:
  /// **'Trạm trải nghiệm'**
  String get tabActivities;

  /// No description provided for @tabJournal.
  ///
  /// In vi, this message translates to:
  /// **'Nhật ký'**
  String get tabJournal;

  /// No description provided for @tabProfile.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ định hướng nghề nghiệp'**
  String get tabProfile;

  /// No description provided for @tabAccount.
  ///
  /// In vi, this message translates to:
  /// **'Cá nhân'**
  String get tabAccount;

  /// No description provided for @careerMapGreeting.
  ///
  /// In vi, this message translates to:
  /// **'Xin chào, {name} 👋'**
  String careerMapGreeting(String name);

  /// No description provided for @careerMapSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Khám phá con đường nghề nghiệp IT phù hợp'**
  String get careerMapSubtitle;

  /// No description provided for @searchHint.
  ///
  /// In vi, this message translates to:
  /// **'Tìm kiếm nghề nghiệp IT, kỹ năng...'**
  String get searchHint;

  /// No description provided for @filterAll.
  ///
  /// In vi, this message translates to:
  /// **'Tất cả'**
  String get filterAll;

  /// No description provided for @viewDetail.
  ///
  /// In vi, this message translates to:
  /// **'Xem chi tiết'**
  String get viewDetail;

  /// No description provided for @skillsMore.
  ///
  /// In vi, this message translates to:
  /// **'+{count} kỹ năng'**
  String skillsMore(int count);

  /// No description provided for @noResults.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy ngành phù hợp'**
  String get noResults;

  /// No description provided for @matchBadge.
  ///
  /// In vi, this message translates to:
  /// **'Phù hợp với bạn'**
  String get matchBadge;

  /// No description provided for @ratingVeryFit.
  ///
  /// In vi, this message translates to:
  /// **'Rất phù hợp'**
  String get ratingVeryFit;

  /// No description provided for @learnersFollowing.
  ///
  /// In vi, this message translates to:
  /// **'Hơn {count} bạn trẻ đang đi theo lộ trình này'**
  String learnersFollowing(int count);

  /// No description provided for @statSalary.
  ///
  /// In vi, this message translates to:
  /// **'Mức lương'**
  String get statSalary;

  /// No description provided for @statDemand.
  ///
  /// In vi, this message translates to:
  /// **'Nhu cầu'**
  String get statDemand;

  /// No description provided for @statWorkMode.
  ///
  /// In vi, this message translates to:
  /// **'Hình thức làm việc'**
  String get statWorkMode;

  /// No description provided for @dailyWorkTitle.
  ///
  /// In vi, this message translates to:
  /// **'Công việc hằng ngày'**
  String get dailyWorkTitle;

  /// No description provided for @realisticTag.
  ///
  /// In vi, this message translates to:
  /// **'Thực tế'**
  String get realisticTag;

  /// No description provided for @roadmapTitle.
  ///
  /// In vi, this message translates to:
  /// **'Lộ trình học tập'**
  String get roadmapTitle;

  /// No description provided for @roadmapStageCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} chặng chuyên sâu'**
  String roadmapStageCount(int count);

  /// No description provided for @stageLabel.
  ///
  /// In vi, this message translates to:
  /// **'CHẶNG'**
  String get stageLabel;

  /// No description provided for @stageTagFoundation.
  ///
  /// In vi, this message translates to:
  /// **'Nền tảng'**
  String get stageTagFoundation;

  /// No description provided for @stageTagCore.
  ///
  /// In vi, this message translates to:
  /// **'Cốt lõi'**
  String get stageTagCore;

  /// No description provided for @stageTagApplied.
  ///
  /// In vi, this message translates to:
  /// **'Ứng dụng'**
  String get stageTagApplied;

  /// No description provided for @stageTagAdvanced.
  ///
  /// In vi, this message translates to:
  /// **'Nâng cao'**
  String get stageTagAdvanced;

  /// No description provided for @stageDuration.
  ///
  /// In vi, this message translates to:
  /// **'Thời lượng: {value}'**
  String stageDuration(String value);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
