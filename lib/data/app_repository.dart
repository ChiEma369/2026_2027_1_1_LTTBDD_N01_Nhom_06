import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tech_trail/data/mock_activities.dart';
import 'package:tech_trail/data/mock_niches.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/models/niche.dart';
import 'package:tech_trail/models/user_acc.dart';

enum AuthError { invalidCredentials, identifierExists }

class AuthException implements Exception {
  final AuthError error;
  const AuthException(this.error);
}

/// Repository mock: toàn bộ dữ liệu nằm trong biến, mất khi tắt app.
class AppRepository {
  static final AppRepository instance = AppRepository();
  final List<UserAccount> _accounts = [];
  final List<ActivityFeedback> _feedbacks = [];
  final Map<String, Set<String>> _registrations = {}; // userId -> {activityId}

  // Tài khoản hiện đang đăng nhập
  UserAccount? _currentUser;
  UserAccount? get currentUser => _currentUser;
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
  List<Niche> get niches => mockNiches;
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
    String? phone,
  }) {
    final email = _normalize(identifier);
    final normalizedPhone = phone == null ? '' : _normalize(phone);

    // Kiểm tra email đã tồn tại
    if (_accounts.any((a) => a.identifier == email)) {
      throw const AuthException(AuthError.identifierExists);
    }

    // Kiểm tra số điện thoại đã tồn tại
    if (normalizedPhone.isNotEmpty &&
        _accounts.any((a) => a.identifier == normalizedPhone)) {
      throw const AuthException(AuthError.identifierExists);
    }

    final id = _nextId('u');
    final passwordHash = hashPassword(password);

    final account = UserAccount(
      id: id,
      identifier: email,
      passwordHash: passwordHash,
      fullName: fullName.trim(),
    );

    _accounts.add(account);
    // Tự động đăng ký hoạt động thử nghiệm cho tài khoản mới
    registerActivity(id, 'a9');

    // Thêm số điện thoại làm thông tin đăng nhập thay thế
    if (normalizedPhone.isNotEmpty) {
      _accounts.add(
        UserAccount(
          id: id,
          identifier: normalizedPhone,
          passwordHash: passwordHash,
          fullName: fullName.trim(),
        ),
      );
    }

    return account;
  }

  UserAccount login(String identifier, String password) {
    final id = _normalize(identifier);
    final hash = hashPassword(password);

    for (final account in _accounts) {
      if (account.identifier == id && account.passwordHash == hash) {
        _currentUser = account;
        return account;
      }
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
  // Cập nhật thông tin tài khoản hiện tại
  void updateCurrentUser({String? fullName, String? className, String? major}) {
    final current = _currentUser;

    if (current == null) return;

    final updated = current.copyWith(
      fullName: fullName,
      className: className,
      major: major,
    );

    // Cập nhật tất cả bản ghi cùng tài khoản
    for (var i = 0; i < _accounts.length; i++) {
      if (_accounts[i].id == current.id) {
        _accounts[i] = updated;
      }
    }

    _currentUser = updated;
  }

  // Đăng xuất
  void logout() {
    _currentUser = null;
  }
}
