import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/data/repositories/auth_repository.dart';
import 'package:tech_trail/models/user_acc.dart';

import 'it_profile_view.dart';
import '../../widgets/profile/it_profile_card.dart';
import '../../widgets/profile/dialogs/edit_profile_dialog.dart';
import '../../widgets/profile/profile_header.dart';
import '../../widgets/profile/personal_info_card.dart';
import '../../widgets/profile/profile_action_buttons.dart';

class ProfileView extends StatefulWidget {
  final VoidCallback onLogout;

  const ProfileView({super.key, required this.onLogout});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthRepository _repository = AuthRepository.instance;

  UserAccount? get _user => _repository.currentUser;

  Future<void> _editProfile() async {
    final user = _user;

    if (user == null) return;

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return EditProfileDialog(
          fullName: user.fullName,
          className: user.className ?? '',
          major: user.major ?? '',
        );
      },
    );

    if (!mounted || result == null) return;

    _repository.updateCurrentUser(
      fullName: result['fullName'],
      className: result['className'],
      major: result['major'],
    );

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cập nhật thông tin hồ sơ thành công.'),
      ),
    );
  }

  void _logout() {
    // Xóa tài khoản đang đăng nhập
    AuthRepository.instance.logout();

    // Quay về màn hình đăng nhập
    widget.onLogout();
  }

  void _openItProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ItProfileView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _user;

    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: Text(
            'Không tìm thấy thông tin tài khoản.\nVui lòng đăng nhập lại.',
            textAlign: TextAlign.center,
            style: AppText.s(14, color: AppColors.muted),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                fullName: user.fullName,
                major: user.major ?? 'Chưa cập nhật',
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItProfileCard(onTap: _openItProfile),

                    const SizedBox(height: 22),

                    Text(
                      'Thông tin tài khoản',
                      style: AppText.s(15, w: FontWeight.w700),
                    ),

                    const SizedBox(height: 12),

                    PersonalInfoCard(
                      fullName: user.fullName,
                      identifier: user.identifier,
                      className: user.className ?? '',
                      major: user.major ?? '',
                    ),

                    const SizedBox(height: 22),

                    ProfileActionButtons(
                      onEdit: _editProfile,
                      onLogout: _logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
