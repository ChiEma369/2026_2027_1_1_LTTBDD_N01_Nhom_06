import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  final String fullName;
  final String major;

  const ProfileHeader({super.key, required this.fullName, required this.major});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.teal900, AppColors.teal700],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          // Tiêu đề nằm chính giữa
          SizedBox(
            height: 42,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.white,
                    size: 19,
                  ),
                ),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).profileHeaderTitle,
                    textAlign: TextAlign.center,
                    style: AppText.s(
                      16,
                      w: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // Ảnh đại diện
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.teal300, width: 2),
            ),
            child: const CircleAvatar(
              radius: 43,
              backgroundColor: AppColors.teal100,
              child: Icon(Icons.person, size: 48, color: AppColors.teal900),
            ),
          ),

          const SizedBox(height: 12),

          // Họ tên
          Text(
            fullName,
            textAlign: TextAlign.center,
            style: AppText.s(18, w: FontWeight.w700, color: AppColors.white),
          ),

          const SizedBox(height: 6),

          Text(
            AppLocalizations.of(context).profileHeaderSubtitle,
            textAlign: TextAlign.center,
            style: AppText.s(11, color: AppColors.white),
          ),

          const SizedBox(height: 5),

          Text(
            major,
            textAlign: TextAlign.center,
            style: AppText.s(11, color: AppColors.teal100),
          ),
        ],
      ),
    );
  }
}
