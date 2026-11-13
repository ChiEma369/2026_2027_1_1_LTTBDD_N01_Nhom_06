import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/auth_validators.dart';
import '../../widgets/auth/auth_header.dart';
import '../../widgets/auth/auth_text_field.dart';
import '../../data/app_repository.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  // Xử lý đăng ký và xác thực dữ liệu
  void _register() {
    FocusScope.of(context).unfocus();

    // Kiểm tra dữ liệu các trường
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Kiểm tra điều khoản
    if (!_agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng đồng ý với điều khoản sử dụng.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      // Lưu tài khoản
      AppRepository.instance.register(
        identifier: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
        fullName: _nameController.text.trim(),
      );

      // Trả về trang đăng nhập
      Navigator.pop(context, _emailController.text.trim());
    } on AuthException catch (e) {
      String message;

      switch (e.error) {
        case AuthError.identifierExists:
          message = 'Email hoặc số điện thoại đã được đăng ký.';
          break;
        case AuthError.invalidCredentials:
          message = 'Thông tin tài khoản không hợp lệ.';
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  // Quay lại màn hình đăng nhập
  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    const AuthHeader(),

                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: AppShadows.card,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Tạo tài khoản',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.teal900,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              'Bắt đầu hành trình khám phá nghề nghiệp IT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.muted,
                              ),
                            ),

                            const SizedBox(height: 18),

                            // Họ và tên
                            AuthTextField(
                              label: 'Họ và tên',
                              hint: 'Nhập họ và tên của bạn',
                              prefixIcon: Icons.person_outline,
                              controller: _nameController,
                              validator: AuthValidators.fullName,
                            ),

                            const SizedBox(height: 13),

                            // Email
                            AuthTextField(
                              label: 'Email',
                              hint: 'example@gmail.com',
                              prefixIcon: Icons.email_outlined,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: AuthValidators.email,
                            ),

                            const SizedBox(height: 13),

                            // Số điện thoại
                            AuthTextField(
                              label: 'Số điện thoại',
                              hint: 'Nhập số điện thoại của bạn',
                              prefixIcon: Icons.phone_outlined,
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              validator: AuthValidators.phone,
                            ),

                            const SizedBox(height: 13),

                            // Mật khẩu
                            AuthTextField(
                              label: 'Mật khẩu',
                              hint: 'Tối thiểu 8 ký tự',
                              prefixIcon: Icons.lock_outline,
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 17,
                                  color: AppColors.muted,
                                ),
                              ),
                              validator: AuthValidators.password,
                            ),

                            const SizedBox(height: 13),

                            // Xác nhận mật khẩu
                            AuthTextField(
                              label: 'Xác nhận mật khẩu',
                              hint: 'Nhập lại mật khẩu',
                              prefixIcon: Icons.lock_reset,
                              controller: _confirmPasswordController,
                              obscureText: _obscureConfirmPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 17,
                                  color: AppColors.muted,
                                ),
                              ),
                              validator: (value) {
                                return AuthValidators.confirmPassword(
                                  value,
                                  _passwordController.text,
                                );
                              },
                            ),

                            const SizedBox(height: 10),

                            // Đồng ý điều khoản
                            Material(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              child: CheckboxListTile(
                                value: _agreeTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _agreeTerms = value ?? false;
                                  });
                                },
                                activeColor: AppColors.teal700,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const Text(
                                  'Tôi đồng ý với điều khoản sử dụng '
                                  'và chính sách bảo mật',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Nút đăng ký
                            SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: _register,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.teal700,
                                  foregroundColor: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: const Text(
                                  'ĐĂNG KÝ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Chuyển sang đăng nhập
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Đã có tài khoản? ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.muted,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _goToLogin,
                                  child: const Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.teal700,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
