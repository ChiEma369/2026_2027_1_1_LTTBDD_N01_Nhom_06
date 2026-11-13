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
  String get tabCareerMap => 'Career Map';

  @override
  String get tabActivities => 'Experience Hub';

  @override
  String get tabJournal => 'Journal';

  @override
  String get tabProfile => 'IT Profile';

  @override
  String get tabAccount => 'Account';

  @override
  String careerMapGreeting(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String get careerMapSubtitle => 'Discover the right IT career path for you';

  @override
  String get searchHint => 'Search IT careers, skills...';

  @override
  String get filterAll => 'All';

  @override
  String get viewDetail => 'View details';

  @override
  String skillsMore(int count) {
    return '+$count skills';
  }

  @override
  String get noResults => 'No matching careers found';

  @override
  String get matchBadge => 'A good match for you';

  @override
  String get ratingVeryFit => 'Very suitable';

  @override
  String learnersFollowing(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'More than $countString young learners are following this path';
  }

  @override
  String get statSalary => 'Salary';

  @override
  String get statDemand => 'Job demand';

  @override
  String get statWorkMode => 'Work arrangement';

  @override
  String get dailyWorkTitle => 'Daily responsibilities';

  @override
  String get realisticTag => 'Real-world';

  @override
  String get roadmapTitle => 'Learning roadmap';

  @override
  String roadmapStageCount(int count) {
    return '$count learning stages';
  }

  @override
  String get stageLabel => 'STAGE';

  @override
  String get stageTagFoundation => 'Foundation';

  @override
  String get stageTagCore => 'Core';

  @override
  String get stageTagApplied => 'Applied';

  @override
  String get stageTagAdvanced => 'Advanced';

  @override
  String stageDuration(String value) {
    return 'Duration: $value';
  }

  @override
  String get activityDetailTitle => 'Activity Details';

  @override
  String get activityHeroEyebrow => 'LEARN THROUGH EXPERIENCE';

  @override
  String get activityHeroHeadline => 'EXPLORE · PRACTICE · GROW';

  @override
  String get activityHeroStatus => 'READY';
}
