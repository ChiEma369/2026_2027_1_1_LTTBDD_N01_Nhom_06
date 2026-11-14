import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ActivityJournalCard extends StatelessWidget {
  final Activity activity;
  final ActivityFeedback? feedback;
  final VoidCallback onTap;

  const ActivityJournalCard({
    super.key,
    required this.activity,
    required this.feedback,
    required this.onTap,
  });

  IconData _activityIcon(ActivityType type) {
    switch (type) {
      case ActivityType.miniProject:
        return Icons.code;
      case ActivityType.workshop:
        return Icons.groups_outlined;
      case ActivityType.seminar:
        return Icons.school_outlined;
      case ActivityType.softSkill:
        return Icons.record_voice_over_outlined;
    }
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');

    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final reviewed = feedback != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 58,
                  decoration: BoxDecoration(
                    color: AppColors.tealSoft,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    _activityIcon(activity.type),
                    color: AppColors.teal700,
                    size: 27,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        switch (activity.type) {
                          ActivityType.miniProject => 'Mini Project',
                          ActivityType.workshop => 'Workshop',
                          ActivityType.seminar => 'Seminar',
                          ActivityType.softSkill =>
                            l10n.journalActivityTypeSoftSkill,
                        },
                        style: AppText.s(
                          9,
                          w: FontWeight.w600,
                          color: AppColors.teal700,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text(
                        activity.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.s(12, w: FontWeight.w700),
                      ),

                      const SizedBox(height: 7),

                      if (reviewed) ...[
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                index < feedback!.interestRating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: AppColors.gold,
                                size: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              l10n.journalRatingStars(feedback!.interestRating),
                              style: AppText.s(10, w: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          l10n.journalWrittenOn(
                            _formatDate(feedback!.createdAt),
                          ),
                          style: AppText.s(
                            9,
                            color: AppColors.green,
                            w: FontWeight.w600,
                          ),
                        ),
                      ] else
                        Text(
                          l10n.journalNotWritten,
                          style: AppText.s(9, color: AppColors.muted),
                        ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                Column(
                  children: [
                    Icon(
                      reviewed ? Icons.check_circle : Icons.chevron_right,
                      color: reviewed ? AppColors.green : AppColors.teal500,
                      size: 23,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reviewed ? l10n.journalReviewed : l10n.journalWrite,
                      textAlign: TextAlign.center,
                      style: AppText.s(
                        8,
                        w: FontWeight.w600,
                        color: reviewed ? AppColors.green : AppColors.teal700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
