class UserAccount {
  final String id;
  final String identifier; // email hoặc số điện thoại
  final String passwordHash; // không lưu mật khẩu thuần
  final String fullName;
  final String? className; // lớp/khoá
  final String? major; // ngành học

  const UserAccount({
    required this.id,
    required this.identifier,
    required this.passwordHash,
    required this.fullName,
    this.className,
    this.major,
  });

  UserAccount copyWith({String? fullName, String? className, String? major}) =>
      UserAccount(
        id: id,
        identifier: identifier,
        passwordHash: passwordHash,
        fullName: fullName ?? this.fullName,
        className: className ?? this.className,
        major: major ?? this.major,
      );
}
