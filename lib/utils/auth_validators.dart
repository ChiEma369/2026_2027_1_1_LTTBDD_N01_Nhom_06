class AuthValidators {
  // Kiểm tra họ và tên
  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập họ và tên';
    }
    if (value.trim().length < 2) {
      return 'Họ và tên phải có ít nhất 2 ký tự';
    }
    return null;
  }

  // Kiểm tra email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập email';
    }
    final pattern = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!pattern.hasMatch(value.trim())) {
      return 'Email không đúng định dạng';
    }
    return null;
  }

  // Kiểm tra số điện thoại Việt Nam
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    final pattern = RegExp(r'^(0[0-9]{9}|\+84[0-9]{9})$');
    if (!pattern.hasMatch(value.trim())) {
      return 'Số điện thoại phải có 10 số hoặc bắt đầu bằng +84';
    }
    return null;
  }

  // Kiểm tra email hoặc số điện thoại khi đăng nhập
  static String? emailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập email hoặc số điện thoại';
    }
    final input = value.trim();
    final emailPattern = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final phonePattern = RegExp(r'^(0[0-9]{9}|\+84[0-9]{9})$');
    if (!emailPattern.hasMatch(input) &&
        !phonePattern.hasMatch(input)) {
      return 'Email hoặc số điện thoại không đúng định dạng';
    }
    return null;
  }

  // Kiểm tra mật khẩu đăng ký
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 8) {
      return 'Mật khẩu phải có ít nhất 8 ký tự';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Mật khẩu phải có ít nhất 1 chữ hoa';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Mật khẩu phải có ít nhất 1 chữ thường';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Mật khẩu phải có ít nhất 1 chữ số';
    }
    if (!RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
      return 'Mật khẩu phải có ít nhất 1 ký tự đặc biệt';
    }

    return null;
  }

  // Kiểm tra xác nhận mật khẩu
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    }
    if (value != password) {
      return 'Mật khẩu xác nhận không trùng khớp';
    }
    return null;
  }
}
