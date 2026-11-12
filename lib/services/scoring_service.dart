import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';

class NicheScoreResult {
  final String nicheId;
  final int activityCount;
  final double? score10; // null nếu chưa có hoạt động nào
  final String label;

  const NicheScoreResult({
    required this.nicheId,
    required this.activityCount,
    this.score10,
    required this.label,
  });
}

class ScoringService {
  static NicheScoreResult calculateForNiche({
    required String nicheId,
    required List<ActivityFeedback> feedbacks,
    required List<Activity> activities,
  }) {
    // Lọc các activity thuộc ngách này
    final nicheActivityIds = activities
        .where((a) => a.nicheId == nicheId)
        .map((a) => a.id)
        .toSet();

    // Lọc các feedback thuộc các activity trên
    final matchedFeedbacks = feedbacks
        .where((f) => nicheActivityIds.contains(f.activityId))
        .toList();

    if (matchedFeedbacks.isEmpty) {
      return NicheScoreResult(
        nicheId: nicheId,
        activityCount: 0,
        score10: null,
        label: 'Chưa có dữ liệu',
      );
    }

    final totalStars = matchedFeedbacks.fold<int>(
      0,
      (sum, f) => sum + f.interestRating,
    );
    final avgStars = totalStars / matchedFeedbacks.length;
    final score10 = double.parse((avgStars * 2).toStringAsFixed(1));

    return NicheScoreResult(
      nicheId: nicheId,
      activityCount: matchedFeedbacks.length,
      score10: score10,
      label: _mapScoreToLabel(score10),
    );
  }

  static String _mapScoreToLabel(double score10) {
    if (score10 < 4.0) return 'Chưa phù hợp';
    if (score10 < 6.0) return 'Cần thử thêm';
    if (score10 < 8.0) return 'Khá phù hợp';
    return 'Rất phù hợp';
  }
}
