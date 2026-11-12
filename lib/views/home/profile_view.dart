import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.teal900,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'IT Profile',
          style: AppText.s(18, w: FontWeight.w700, color: AppColors.white),
        ),
      ),
      body: const Center(child: Text('Nội dung IT Profile')),
    );
  }
}
