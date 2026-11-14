import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onTap;

  IconData get activityIcon {
    switch (activity.nicheId) {
      case 'web':
        return Icons.web;
      case 'mobile':
        return Icons.smartphone;
      case 'backend':
        return Icons.dns;
      case 'desktop-game':
        return Icons.videogame_asset;
      case 'data-analyst':
        return Icons.analytics;
      case 'data-engineer':
        return Icons.storage;
      case 'ai-ml':
        return Icons.psychology;
      case 'qa-tester':
        return Icons.bug_report;
      case 'security':
        return Icons.security;
      case 'sys-net-admin':
        return Icons.settings_ethernet;
      case 'cloud-devops':
        return Icons.cloud;
      case 'ba':
        return Icons.business_center;
      case 'pm':
        return Icons.assignment;
      case 'po':
        return Icons.lightbulb;
      default:
        return _getIconByType();
    }
  }

  Color get bannerColor {
    switch (activity.nicheId) {
      case 'web':
      case 'backend':
      case 'data-analyst':
      case 'qa-tester':
      case 'ba':
      case 'pm':
      case 'po':
        return const Color(0xFF3B6375);

      case 'mobile':
      case 'desktop-game':
      case 'ai-ml':
      case 'data-engineer':
      case 'security':
      case 'sys-net-admin':
      case 'cloud-devops':
        return const Color(0xFF2E5163);

      default:
        return const Color(0xFF3B6375);
    }
  }

  IconData _getIconByType() {
    switch (activity.type) {
      case ActivityType.miniProject:
        return Icons.terminal;
      case ActivityType.workshop:
        return Icons.groups;
      case ActivityType.seminar:
        return Icons.co_present;
      case ActivityType.softSkill:
        return Icons.psychology;
    }
  }

  const ActivityCard({super.key, required this.activity, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner hoạt động
              Container(
                height: 128,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bannerColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 18,
                      left: 24,
                      child: Icon(
                        activityIcon,
                        size: 24,
                        color: Colors.white.withValues(alpha: 0.12),
                      ),
                    ),
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Icon(activityIcon, size: 46, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Nội dung hoạt động
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.titleOf(languageCode),
                      style: AppText.s(
                        16,
                        w: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      activity.descriptionOf(languageCode),
                      style: AppText.s(12, color: AppColors.muted, height: 1.5),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 14,
                          color: AppColors.muted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          activity.durationOf(languageCode),
                          style: AppText.s(11, color: AppColors.muted),
                        ),

                        const SizedBox(width: 16),

                        const Icon(Icons.star, size: 14, color: AppColors.gold),
                        const SizedBox(width: 4),
                        Text(
                          activity.rating.toStringAsFixed(1),
                          style: AppText.s(11, color: AppColors.muted),
                        ),

                        const SizedBox(width: 16),

                        const Icon(
                          Icons.people_outline,
                          size: 14,
                          color: AppColors.muted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          l10n.activityParticipantCount(
                            activity.participantCount,
                          ),
                          style: AppText.s(11, color: AppColors.muted),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          l10n.activityViewDetails,
                          style: AppText.s(
                            12,
                            w: FontWeight.w600,
                            color: AppColors.teal700,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: AppColors.teal700,
                        ),
                      ],
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
