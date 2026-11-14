import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/utils/app_theme.dart';

class PersonalInfoCard extends StatelessWidget {
  final String fullName;
  final String identifier;
  final String className;
  final String major;

  const PersonalInfoCard({
    super.key,
    required this.fullName,
    required this.identifier,
    required this.className,
    required this.major,
  });

  @override
  Widget build(BuildContext context) {
    final isEmail = identifier.contains('@');

    return Column(
      children: [
        _infoItem(
          context: context,
          icon: Icons.person_outline,
          label: AppLocalizations.of(context).profileFullName,
          value: fullName,
        ),
        const SizedBox(height: 12),

        _infoItem(
          context: context,
          icon: Icons.mail_outline,
          label: isEmail
              ? 'EMAIL'
              : AppLocalizations.of(context).profilePhoneNumber,
          value: identifier,
        ),
        const SizedBox(height: 12),

        _infoItem(
          context: context,
          icon: Icons.school_outlined,
          label: AppLocalizations.of(context).profileClassName,
          value: className,
        ),
        const SizedBox(height: 12),

        _infoItem(
          context: context,
          icon: Icons.menu_book_outlined,
          label: AppLocalizations.of(context).profileMajor,
          value: major,
        ),
      ],
    );
  }

  Widget _infoItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.teal900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.white, size: 20),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppText.s(
                    9,
                    w: FontWeight.w500,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value.isEmpty
                      ? AppLocalizations.of(context).profileMajorNotUpdated
                      : value,
                  style: AppText.s(
                    12,
                    w: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: AppColors.teal300, size: 20),
        ],
      ),
    );
  }
}
