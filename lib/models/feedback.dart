enum Difficulty { easy, fit, hard }

typedef Feedback = ActivityFeedback;

class ActivityFeedback {
  final String id;
  final String userId;
  final String activityId;
  final int interestRating;
  final Difficulty difficulty;
  final String? note;
  final DateTime createdAt;

  const ActivityFeedback({
    required this.id,
    required this.userId,
    required this.activityId,
    required this.interestRating,
    required this.difficulty,
    this.note,
    required this.createdAt,
  });
}
