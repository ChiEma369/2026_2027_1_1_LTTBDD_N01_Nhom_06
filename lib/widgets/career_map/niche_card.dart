import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/models/niche_detail.dart';

IconData nicheIcon(String nicheId) => switch (nicheId) {
  // Phát triển phần mềm
  'web' => Icons.laptop_mac,
  'mobile' => Icons.smartphone_outlined,
  'backend' => Icons.dns_outlined,
  'desktop-game' => Icons.sports_esports_outlined,
  // Dữ liệu & AI
  'ai-ml' => Icons.psychology_outlined,
  'data-analyst' => Icons.bar_chart_outlined,
  'data-engineer' => Icons.storage_outlined,
  // Cháº¥t lÆ°á»£ng & Báº£o máº­t
  'security' => Icons.shield_outlined,
  'qa-tester' => Icons.bug_report_outlined,
  // Háº¡ táº§ng & Váº­n hÃ nh
  'cloud-devops' => Icons.cloud_outlined,
  'sys-net-admin' => Icons.router_outlined,
  // Quáº£n trá»‹ dá»± Ã¡n & sáº£n pháº©m
  'ba' => Icons.analytics_outlined,
  'pm' => Icons.assignment_outlined,
  'po' => Icons.lightbulb_outlined,
  _ => Icons.work_outline,
};

class NicheCard extends StatelessWidget {
  const NicheCard({
    super.key,
    required this.detail,
    required this.onTap,
  });
  final NicheDetail detail;
  final VoidCallback onTap;

  static const _maxTags = 3;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final shown = detail.skills.take(_maxTags).toList();
    final hidden = detail.skills.length - shown.length;

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.tealSoft,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      nicheIcon(detail.nicheId),
                      color: AppColors.teal900,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail.displayName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          detail.tagline,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final s in shown) _Tag(s),
                  if (hidden > 0) _Tag(l10n.skillsMore(hidden)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 16,
                    color: AppColors.gold,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    detail.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    l10n.viewDetail,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.teal700,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: AppColors.teal700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: AppColors.teal100,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        color: AppColors.text,
      ),
    ),
  );
}

