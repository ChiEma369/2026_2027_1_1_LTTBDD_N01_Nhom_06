enum StageTag { foundation, core, applied, advanced }

class DailyTask {
  final String title;
  final String description;
  final String? titleEn;
  final String? descriptionEn;

  const DailyTask({
    required this.title,
    required this.description,
    this.titleEn,
    this.descriptionEn,
  });

  String titleOf(String languageCode) =>
      languageCode == 'en' ? (titleEn ?? title) : title;

  String descriptionOf(String languageCode) =>
      languageCode == 'en' ? (descriptionEn ?? description) : description;
}

class RoadmapStage {
  final int order;
  final String title;
  final String description;
  final StageTag tag;
  final String duration;
  final String outcome;

  final String? titleEn;
  final String? descriptionEn;
  final String? outcomeEn;

  const RoadmapStage({
    required this.order,
    required this.title,
    required this.description,
    required this.tag,
    required this.duration,
    required this.outcome,
    this.titleEn,
    this.descriptionEn,
    this.outcomeEn,
  });

  String titleOf(String languageCode) =>
      languageCode == 'en' ? (titleEn ?? title) : title;

  String descriptionOf(String languageCode) =>
      languageCode == 'en' ? (descriptionEn ?? description) : description;

  String outcomeOf(String languageCode) =>
      languageCode == 'en' ? (outcomeEn ?? outcome) : outcome;
}

/// Nội dung hiển thị trên màn Career Map và màn chi tiết ngách.
class NicheDetail {
  final String nicheId;
  final String displayName;
  final String tagline;
  final String subtitle;
  final List<String> skills;
  final double rating;
  final int learnerCount;
  final String salaryRange;
  final String demand;
  final String workMode;
  final List<DailyTask> dailyTasks;
  final List<RoadmapStage> stages;

  final String? displayNameEn;
  final String? taglineEn;
  final String? subtitleEn;
  final String? demandEn;

  const NicheDetail({
    required this.nicheId,
    required this.displayName,
    required this.tagline,
    required this.subtitle,
    required this.skills,
    required this.rating,
    required this.learnerCount,
    required this.salaryRange,
    required this.demand,
    required this.workMode,
    required this.dailyTasks,
    required this.stages,
    this.displayNameEn,
    this.taglineEn,
    this.subtitleEn,
    this.demandEn,
  });

  String displayNameOf(String languageCode) => displayName;

  String taglineOf(String languageCode) =>
      languageCode == 'en' ? (taglineEn ?? tagline) : tagline;

  String subtitleOf(String languageCode) =>
      languageCode == 'en' ? (subtitleEn ?? subtitle) : subtitle;

  String demandOf(String languageCode) =>
      languageCode == 'en' ? (demandEn ?? demand) : demand;
}
