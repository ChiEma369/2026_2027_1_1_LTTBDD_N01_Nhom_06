enum ActivityType { miniProject, workshop, seminar, softSkill }

class Activity {
  final String id;
  final String title;
  final ActivityType type;
  final String? nicheId; 
  final String description;

  const Activity({
    required this.id,
    required this.title,
    required this.type,
    this.nicheId,
    required this.description,
  });
}
