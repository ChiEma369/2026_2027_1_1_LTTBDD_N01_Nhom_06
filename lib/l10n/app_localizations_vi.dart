// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'TechTrail';

  @override
  String get tabCareerMap => 'Bản đồ nghề nghiệp';

  @override
  String get tabActivities => 'Trạm trải nghiệm';

  @override
  String get tabJournal => 'Nhật ký';

  @override
  String get tabProfile => 'Hồ Sơ IT';

  @override
  String get tabAccount => 'Cá nhân';

  @override
  String careerMapGreeting(String name) {
    return 'Xin chào, $name 👋';
  }

  @override
  String get careerMapSubtitle => 'Khám phá con đường nghề nghiệp IT phù hợp';

  @override
  String get searchHint => 'Tìm kiếm nghề nghiệp IT, kỹ năng...';

  @override
  String get filterAll => 'Tất cả';

  @override
  String get viewDetail => 'Xem chi tiết';

  @override
  String skillsMore(int count) {
    return '+$count kỹ năng';
  }

  @override
  String get noResults => 'Không tìm thấy ngành phù hợp';

  @override
  String get matchBadge => 'Phù hợp với bạn';

  @override
  String get ratingVeryFit => 'Rất phù hợp';

  @override
  String learnersFollowing(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Hơn $countString bạn trẻ đang đi theo lộ trình này';
  }

  @override
  String get statSalary => 'Mức lương';

  @override
  String get statDemand => 'Nhu cầu';

  @override
  String get statWorkMode => 'Hình thức';

  @override
  String get dailyWorkTitle => 'Công việc hằng ngày';

  @override
  String get realisticTag => 'Thực tế';

  @override
  String get roadmapTitle => 'Roadmap môn học';

  @override
  String roadmapStageCount(int count) {
    return '$count chặng chuyên sâu';
  }

  @override
  String get stageLabel => 'CHẶNG';

  @override
  String get stageTagFoundation => 'Nền tảng';

  @override
  String get stageTagCore => 'Cốt lõi';

  @override
  String get stageTagApplied => 'Ứng dụng';

  @override
  String get stageTagAdvanced => 'Nâng cao';

  @override
  String stageDuration(String value) {
    return 'Thời lượng: $value';
  }
}
