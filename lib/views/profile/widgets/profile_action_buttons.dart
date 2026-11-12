import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ProfileActionButtons extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onLogout;

  const ProfileActionButtons({
    super.key,
    required this.onEdit,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: Text(
              'CHỈNH SỬA HỒ SƠ',
              style: AppText.s(12, w: FontWeight.w600, color: AppColors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.teal700,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: onLogout,
          icon: const Icon(Icons.logout, size: 17, color: AppColors.muted),
          label: Text(
            'Đăng xuất',
            style: AppText.s(12, color: AppColors.muted),
          ),
        ),
      ],
    );
  }
}
