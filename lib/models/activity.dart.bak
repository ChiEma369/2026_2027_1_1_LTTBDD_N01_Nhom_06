enum ActivityType { miniProject, workshop, seminar, softSkill }

enum ActivityDifficulty { beginner, intermediate, advanced }

class ActivityLesson {
  final String title;
  final String duration;
  final String description;
  final String? titleEn;
  final String? descriptionEn;
  final String? durationEn;

  const ActivityLesson({
    required this.title,
    required this.duration,
    required this.description,
    this.titleEn,
    this.descriptionEn,
    this.durationEn,
  });
  String titleOf(String languageCode) {
    if (languageCode == 'en') {
      return titleEn ?? title;
    }
    return title;
  }

  String descriptionOf(String languageCode) {
    if (languageCode == 'en') {
      return descriptionEn ?? description;
    }
    return description;
  }

  String durationOf(String languageCode) {
    if (languageCode == 'en') {
      return durationEn ?? duration;
    }
    return duration;
  }
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
  final String? relatedCareerNicheId;
  final String relatedCareerDescription;
  final String? titleEn;
  final String? descriptionEn;
  final String? objectiveEn;
  final List<String>? toolsEn;
  final String? relatedCareerEn;
  final String? relatedCareerDescriptionEn;
  final String? durationEn;

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
    this.relatedCareerNicheId,
    this.relatedCareerDescription = '',
    this.titleEn,
    this.descriptionEn,
    this.objectiveEn,
    this.toolsEn,
    this.relatedCareerEn,
    this.relatedCareerDescriptionEn,
    this.durationEn,
  });
  String titleOf(String languageCode) {
    if (languageCode == 'en') {
      return titleEn ?? title;
    }
    return title;
  }

  String descriptionOf(String languageCode) {
    if (languageCode == 'en') {
      return descriptionEn ?? description;
    }
    return description;
  }

  String objectiveOf(String languageCode) {
    if (languageCode == 'en') {
      return objectiveEn ?? objective;
    }
    return objective;
  }

  List<String> toolsOf(String languageCode) {
    if (languageCode == 'en') {
      return toolsEn ?? tools;
    }
    return tools;
  }

  String relatedCareerOf(String languageCode) {
    if (languageCode == 'en') {
      return relatedCareerEn ?? relatedCareer;
    }
    return relatedCareer;
  }

  String relatedCareerDescriptionOf(String languageCode) {
    if (languageCode == 'en') {
      return relatedCareerDescriptionEn ?? relatedCareerDescription;
    }
    return relatedCareerDescription;
  }

  String durationOf(String languageCode) {
    if (languageCode == 'en') {
      return durationEn ?? duration;
    }
    return duration;
  }
}
