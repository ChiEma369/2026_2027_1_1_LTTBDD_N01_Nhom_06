import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/utils/app_theme.dart';

class JournalStatistics extends StatelessWidget {
  final int activityCount;
  final int completedCount;

  const JournalStatistics({
    super.key,
    required this.activityCount,
    required this.completedCount,
  });

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.12)),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.teal300, size: 22),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppText.s(
                      12,
                      w: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(subtitle, style: AppText.s(9, color: AppColors.teal100)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        _buildStatCard(
          icon: Icons.check_circle_outline,
          title: l10n.journalActivityCount(activityCount),
          subtitle: l10n.journalRegistered,
        ),
        const SizedBox(width: 10),
        _buildStatCard(
          icon: Icons.edit_note,
          title: l10n.journalCompletedCount(completedCount),
          subtitle: l10n.journalCompleted,
        ),
      ],
    );
  }
}
