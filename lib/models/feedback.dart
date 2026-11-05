enum Difficulty { easy, fit, hard }

/// Phiếu Nhật ký thực chiến
class ActivityFeedback {
  final String id;
  final String userId;
  final String activityId;
  final int interestRating; // 1–5, bắt buộc
  final Difficulty difficulty; // bắt buộc
  final String? note; // không bắt buộc, tối đa ~150 ký tự
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
