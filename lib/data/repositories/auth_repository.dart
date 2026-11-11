
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tech_trail/models/user_acc.dart';

enum AuthError { invalidCredentials, identifierExists }

class AuthException implements Exception {
  final AuthError error;

  const AuthException(this.error);
}

class AuthRepository {
  final List<UserAccount> _accounts = [];

  AuthRepository() {
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

  String _normalize(String identifier) =>
      identifier.trim().toLowerCase();

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
      id: 'u${_accounts.length}',
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

    for (final account in _accounts) {
      if (account.identifier == id && account.passwordHash == hash) {
        return account;
      }
    }

    throw const AuthException(AuthError.invalidCredentials);
  }
}