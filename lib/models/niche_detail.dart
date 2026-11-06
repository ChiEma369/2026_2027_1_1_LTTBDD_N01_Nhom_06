enum StageTag { foundation, core, applied, advanced }

class DailyTask {
  final String title;
  final String description;
  const DailyTask({required this.title, required this.description});
}

class RoadmapStage {
  final int order;
  final String title;
  final String description;
  final StageTag tag;
  final String duration;
  final String outcome;
  const RoadmapStage({
    required this.order,
    required this.title,
    required this.description,
    required this.tag,
    required this.duration,
    required this.outcome,
  });
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
  });
}
