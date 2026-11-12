enum ActivityType { miniProject, workshop, seminar, softSkill }

enum ActivityDifficulty { beginner, intermediate, advanced }

class ActivityLesson {
  final String title;
  final String duration;
  final String description;

  const ActivityLesson({
    required this.title,
    required this.duration,
    required this.description,
  });
}

class Activity {
  final String id;
  final String title;
  final ActivityType type;
  final String? nicheId;
  final String description;
  final String duration;
  final double rating;
  final int participantCount;
  final String objective;
  final ActivityDifficulty difficulty;
  final List<ActivityLesson> lessons;
  final List<String> tools;
  final String relatedCareer;
  final String relatedCareerDescription;

  const Activity({
    required this.id,
    required this.title,
    required this.type,
    this.nicheId,
    required this.description,
    this.duration = '2–3 giờ',
    this.rating = 4.8,
    this.participantCount = 128,
    this.objective = '',
    this.difficulty = ActivityDifficulty.beginner,
    this.lessons = const [],
    this.tools = const [],
    this.relatedCareer = '',
    this.relatedCareerDescription = '',
  });
}
