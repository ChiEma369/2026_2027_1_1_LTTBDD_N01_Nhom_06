import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tech_trail/models/user_acc.dart';

enum AuthError { invalidCredentials, identifierExists }

class AuthException implements Exception {
  final AuthError error;

  const AuthException(this.error);
}

class AuthRepository {
  static final AuthRepository instance = AuthRepository._internal();

  AuthRepository._internal() {
    _accounts.add(
      UserAccount(
        id: 'u0',
        identifier: 'chiema@gmail.com',
        passwordHash: hashPassword('123456'),
        fullName: 'Lưu Thị Linh Chi',
      ),
    );
  }
  final List<UserAccount> _accounts = [];
  UserAccount? _currentUser;
  UserAccount? get currentUser => _currentUser;
  int _nextId = 1;
  static String hashPassword(String password) =>
      sha256.convert(utf8.encode(password)).toString();

  String _normalize(String identifier) =>
      identifier.trim().toLowerCase();

  UserAccount register({
    required String identifier,
    required String phone,
    required String password,
    required String fullName,
  }) {
    final email = _normalize(identifier);
    final normalizedPhone = _normalize(phone);

    final identifierExists = _accounts.any(
      (account) =>
          account.identifier == email ||
          account.identifier == normalizedPhone,
    );

    if (identifierExists) {
      throw const AuthException(AuthError.identifierExists);
    }

    final userId = 'u$_nextId';
    _nextId++;

    final passwordHash = hashPassword(password);

    final emailAccount = UserAccount(
      id: userId,
      identifier: email,
      passwordHash: passwordHash,
      fullName: fullName.trim(),
    );

    final phoneAccount = UserAccount(
      id: userId,
      identifier: normalizedPhone,
      passwordHash: passwordHash,
      fullName: fullName.trim(),
    );

    _accounts.addAll([emailAccount, phoneAccount]);

    return emailAccount;
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

  void logout() {
    _currentUser = null;
  }

  void updateCurrentUser({
    String? fullName,
    String? className,
    String? major,
  }) {
    if (_currentUser == null) return;

    final userId = _currentUser!.id;

    for (int i = 0; i < _accounts.length; i++) {
      if (_accounts[i].id == userId) {
        _accounts[i] = _accounts[i].copyWith(
          fullName: fullName,
          className: className,
          major: major,
        );
      }
    }
    _currentUser = _currentUser!.copyWith(
      fullName: fullName,
      className: className,
      major: major,
    );
  }
}
