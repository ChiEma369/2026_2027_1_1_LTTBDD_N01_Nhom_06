import 'package:tech_trail/data/mock/mock_activities.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:flutter/foundation.dart';

class ActivityRepository extends ChangeNotifier {
  final List<ActivityFeedback> _feedbacks = [];
  final Map<String, Set<String>> _registrations = {};

  int _idCounter = 0;

  String _nextId(String prefix) => '$prefix${++_idCounter}';

  // Danh sách hoạt động
  List<Activity> get activities => mockActivities;

  // Kiểm tra sinh viên đã đăng ký hoạt động chưa
  bool isRegistered(String userId, String activityId) =>
      _registrations[userId]?.contains(activityId) ?? false;

  // Đăng ký hoạt động
  bool registerActivity(String userId, String activityId) {
    final success = _registrations
        .putIfAbsent(userId, () => <String>{})
        .add(activityId);
    if (success) {
      notifyListeners();
    }
    return success;
  }

  // Danh sách ID hoạt động đã đăng ký
  List<String> registeredActivityIds(String userId) =>
      List.unmodifiable(_registrations[userId] ?? const <String>{});

  // Kiểm tra đã gửi nhật ký thực chiến chưa
  bool hasFeedback(String userId, String activityId) =>
      _feedbacks.any(
        (feedback) =>
            feedback.userId == userId &&
            feedback.activityId == activityId,
      );

  // Gửi nhật ký và phản hồi
  ActivityFeedback? addFeedback({
    required String userId,
    required String activityId,
    required int interestRating,
    required Difficulty difficulty,
    String? note,
  }) {
    if (hasFeedback(userId, activityId)) return null;

    final feedback = ActivityFeedback(
      id: _nextId('f'),
      userId: userId,
      activityId: activityId,
      interestRating: interestRating,
      difficulty: difficulty,
      note: note,
      createdAt: DateTime.now(),
    );

    _feedbacks.add(feedback);
    notifyListeners();
    return feedback;
  }

  // Lấy danh sách nhật ký của sinh viên
  List<ActivityFeedback> feedbacksOf(String userId) => _feedbacks
      .where((feedback) => feedback.userId == userId)
      .toList();
}
