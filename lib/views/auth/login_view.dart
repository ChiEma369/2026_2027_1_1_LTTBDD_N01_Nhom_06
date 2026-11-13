import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/auth_validators.dart';
import '../../widgets/auth/auth_header.dart';
import '../../widgets/auth/auth_text_field.dart';
import '../../data/repositories/auth_repository.dart';
import '../navigation/main_navigation_view.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Xử lý đăng nhập và xác thực dữ liệu
  void _login() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      // Kiểm tra tài khoản và mật khẩu
      AuthRepository.instance.login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      // Đăng nhập thành công: chuyển sang trang chủ
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavigationView(),
        ),
      );
    } on AuthException catch (e) {
      String message;

      switch (e.error) {
        case AuthError.invalidCredentials:
          message =
              'Email/số điện thoại hoặc mật khẩu không chính xác.';
          break;
        case AuthError.identifierExists:
          message = 'Thông tin tài khoản không hợp lệ.';
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  // Chuyển sang màn hình đăng ký
  Future<void> _goToRegister() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const RegisterView()),
    );

    if (!mounted) return;

    if (result != null) {
      _emailController.text = result;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Đăng ký thành công! Hãy nhập mật khẩu để đăng nhập.',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  // Nút đăng nhập bằng Google/GitHub
  void _socialLogin(String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Đăng nhập bằng $provider sẽ được bổ sung sau.',
        ),
      ),
    );
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
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  children: [
                    const AuthHeader(),

                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
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
                              'Đăng nhập',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.teal900,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              'Chào mừng bạn quay trở lại với tương lai IT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.muted,
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Email hoặc số điện thoại
                            AuthTextField(
                              label: 'Email hoặc Số điện thoại',
                              hint: 'Nhập email hoặc số điện thoại',
                              prefixIcon: Icons.alternate_email,
                              controller: _emailController,
                              keyboardType:
                                  TextInputType.emailAddress,
                              validator: AuthValidators.emailOrPhone,
                            ),

                            const SizedBox(height: 15),

                            // Mật khẩu
                            AuthTextField(
                              label: 'Mật khẩu',
                              hint: 'Nhập mật khẩu',
                              prefixIcon: Icons.lock_outline,
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword =
                                        !_obscurePassword;
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập mật khẩu';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 8),

                            // Ghi nhớ và quên mật khẩu
                            Row(
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: Checkbox(
                                    value: _rememberMe,
                                    activeColor: AppColors.teal700,
                                    visualDensity:
                                        VisualDensity.compact,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                ),

                                const Text(
                                  'Ghi nhớ',
                                  style: TextStyle(fontSize: 10),
                                ),

                                const Spacer(),

                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Chức năng quên mật khẩu '
                                          'sẽ được bổ sung sau.',
                                        ),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Text(
                                    'Quên mật khẩu?',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.teal700,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 5),

                            // Nút đăng nhập
                            SizedBox(
                              width: double.infinity,
                              height: 43,
                              child: ElevatedButton(
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.teal700,
                                  foregroundColor: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(11),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ĐĂNG NHẬP',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Phân cách đăng nhập mạng xã hội
                            Row(
                              children: [
                                const Expanded(child: Divider()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    'Hoặc tiếp tục với',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                ),
                                const Expanded(child: Divider()),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // Google và GitHub
                            Row(
                              children: [
                                Expanded(
                                  child: _SocialButton(
                                    title: 'Google',
                                    icon: Icons.g_mobiledata,
                                    onPressed: () {
                                      _socialLogin('Google');
                                    },
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: _SocialButton(
                                    title: 'GitHub',
                                    icon: Icons.code,
                                    onPressed: () {
                                      _socialLogin('GitHub');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 85),

                    // Chuyển sang đăng ký
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Chưa có tài khoản? ',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.muted,
                          ),
                        ),

                        GestureDetector(
                          onTap: _goToRegister,
                          child: const Text(
                            'Đăng ký ngay',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.teal900,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
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

// Widget nút đăng nhập mạng xã hội
class _SocialButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(title, style: const TextStyle(fontSize: 11)),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.text,
        side: const BorderSide(color: AppColors.divider),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 11),
      ),
    );
  }
}
