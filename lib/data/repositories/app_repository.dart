import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tech_trail/data/mock/mock_activities.dart';
import 'package:tech_trail/data/mock/mock_niches.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/models/niche.dart';
import 'package:tech_trail/models/user_acc.dart';

import 'package:tech_trail/data/mock/mock_niche_details.dart';
import 'package:tech_trail/models/niche_detail.dart';

enum AuthError { invalidCredentials, identifierExists }

class AuthException implements Exception {
  final AuthError error;
  const AuthException(this.error);
}

/// Repository mock: toàn bộ dữ liệu nằm trong biến, mất khi tắt app.
class AppRepository {
  final List<UserAccount> _accounts = [];
  final List<ActivityFeedback> _feedbacks = [];
  final Map<String, Set<String>> _registrations = {}; // userId -> {activityId}
  int _idCounter = 0;

  AppRepository() {
    _accounts.add(
      UserAccount(
        id: 'u0',
        identifier: 'chiema@gmail.com',
        passwordHash: hashPassword('123456'),
        fullName: 'Lưu Thị Linh Chi',
      ),
    );
  }

  static String hashPassword(String password) =>
      sha256.convert(utf8.encode(password)).toString();

  String _nextId(String prefix) => '$prefix${++_idCounter}';
  String _normalize(String identifier) => identifier.trim().toLowerCase();

  // ---------- Dữ liệu tĩnh ----------
  List<CareerField> get fields => mockFields;
  /// Trả về tất cả 14 ngách (có NicheDetail).
  List<Niche> get featuredNiches =>
      mockNiches.where((n) => mockNicheDetails.containsKey(n.id)).toList();
  NicheDetail? detailOf(String nicheId) => mockNicheDetails[nicheId];
  List<Activity> get activities => mockActivities;

  Niche? nicheById(String id) {
    for (final n in mockNiches) {
      if (n.id == id) return n;
    }
    return null;
  }

  // ---------- Tài khoản ----------
  UserAccount register({
    required String identifier,
    required String password,
    required String fullName,
  }) {
    final id = _normalize(identifier);
    if (_accounts.any((a) => a.identifier == id)) {
      throw const AuthException(AuthError.identifierExists);
    }
    final account = UserAccount(
      id: _nextId('u'),
      identifier: id,
      passwordHash: hashPassword(password),
      fullName: fullName.trim(),
    );
    _accounts.add(account);
    return account;
  }

  UserAccount login(String identifier, String password) {
    final id = _normalize(identifier);
    final hash = hashPassword(password);
    for (final a in _accounts) {
      if (a.identifier == id && a.passwordHash == hash) return a;
    }
    throw const AuthException(AuthError.invalidCredentials);
  }

  // ---------- Hoạt động đã đăng ký (BR2.3: mỗi hoạt động đăng ký 1 lần) ----------
  bool isRegistered(String userId, String activityId) =>
      _registrations[userId]?.contains(activityId) ?? false;

  /// Trả về false nếu đã đăng ký trước đó.
  bool registerActivity(String userId, String activityId) =>
      _registrations.putIfAbsent(userId, () => <String>{}).add(activityId);

  List<String> registeredActivityIds(String userId) =>
      List.unmodifiable(_registrations[userId] ?? const <String>{});

  // ---------- Nhật ký thực chiến (BR3.2: mỗi hoạt động 1 phiếu) ----------
  bool hasFeedback(String userId, String activityId) =>
      _feedbacks.any((f) => f.userId == userId && f.activityId == activityId);

  /// Trả về null nếu hoạt động này đã có phiếu phản hồi.
  ActivityFeedback? addFeedback({
    required String userId,
    required String activityId,
    required int interestRating,
    required Difficulty difficulty,
    String? note,
  }) {
    if (hasFeedback(userId, activityId)) return null;
    final fb = ActivityFeedback(
      id: _nextId('f'),
      userId: userId,
      activityId: activityId,
      interestRating: interestRating,
      difficulty: difficulty,
      note: note,
      createdAt: DateTime.now(),
    );
    _feedbacks.add(fb);
    return fb;
  }

  List<ActivityFeedback> feedbacksOf(String userId) =>
      _feedbacks.where((f) => f.userId == userId).toList();
}
