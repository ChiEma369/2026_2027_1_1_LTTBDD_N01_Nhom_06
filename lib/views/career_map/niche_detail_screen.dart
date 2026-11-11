import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/models/niche_detail.dart';
import 'package:tech_trail/data/repositories/career_map_repository.dart';
import 'package:tech_trail/widgets/niche_card.dart' show nicheIcon;

class NicheDetailScreen extends StatelessWidget {
  const NicheDetailScreen({super.key, required this.nicheId});
  final String nicheId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final detail = context.read<CareerMapRepository>().detailOf(
      nicheId,
    );

    if (detail == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.noResults)),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.teal900,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        children: [
          _HeroCard(detail: detail),
          const SizedBox(height: 20),
          _SectionHeader(
            icon: Icons.work_outline,
            title: l10n.dailyWorkTitle,
            badge: l10n.realisticTag,
          ),
          const SizedBox(height: 10),
          _DailyTasksCard(tasks: detail.dailyTasks),
          const SizedBox(height: 20),
          _SectionHeader(
            icon: Icons.map_outlined,
            title: l10n.roadmapTitle,
            badge: l10n.roadmapStageCount(detail.stages.length),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < detail.stages.length; i++)
            _StageTile(
              stage: detail.stages[i],
              isLast: i == detail.stages.length - 1,
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_outline),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.teal700, AppColors.teal500]),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () =>
                        Navigator.of(context)
                            .popUntil((r) => r.isFirst),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.tabActivities,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.detail});
  final NicheDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.teal900,
              boxShadow: AppShadows.card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              nicheIcon(detail.nicheId),
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            detail.displayName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.teal900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            detail.subtitle,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: AppColors.teal100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'ðŸŽ¯ ${l10n.matchBadge}',
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.teal900,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_rounded,
                color: AppColors.gold,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                detail.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                ' / 5.0',
                style: TextStyle(color: AppColors.muted),
              ),
              if (detail.rating >= 4.5) ...[
                const SizedBox(width: 8),
                Text(
                  l10n.ratingVeryFit,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.teal700,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.groups_outlined,
                size: 16,
                color: AppColors.muted,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  l10n.learnersFollowing(detail.learnerCount),
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _StatBox(
                  label: l10n.statSalary,
                  value: detail.salaryRange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatBox(
                  label: l10n.statDemand,
                  value: detail.demand,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatBox(
                  label: l10n.statWorkMode,
                  value: detail.workMode,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    decoration: BoxDecoration(
      color: AppColors.teal100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.teal900,
          ),
        ),
      ],
    ),
  );
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.badge,
  });
  final IconData icon;
  final String title;
  final String badge;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.teal300.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: AppColors.teal700),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.teal900,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          color: AppColors.tealSoft,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          badge,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.teal900,
          ),
        ),
      ),
    ],
  );
}

class _DailyTasksCard extends StatelessWidget {
  const _DailyTasksCard({required this.tasks});
  final List<DailyTask> tasks;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: AppShadows.card,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        for (var i = 0; i < tasks.length; i++) ...[
          if (i > 0) const Divider(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check_circle,
                size: 18,
                color: AppColors.green,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tasks[i].title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tasks[i].description,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    ),
  );
}

class _StageTile extends StatelessWidget {
  const _StageTile({required this.stage, required this.isLast});
  final RoadmapStage stage;
  final bool isLast;

  String _tagText(AppLocalizations l10n) => switch (stage.tag) {
    StageTag.foundation => l10n.stageTagFoundation,
    StageTag.core => l10n.stageTagCore,
    StageTag.applied => l10n.stageTagApplied,
    StageTag.advanced => l10n.stageTagAdvanced,
  };

  Color get _tagColor => switch (stage.tag) {
    StageTag.foundation => AppColors.green,
    StageTag.core => AppColors.teal700,
    StageTag.applied => AppColors.teal500,
    StageTag.advanced => AppColors.gold,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Container(
                  width: 44,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.teal700, AppColors.teal500],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        l10n.stageLabel,
                        style: const TextStyle(
                          fontSize: 7,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        stage.order.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.teal300.withValues(alpha: 0.5),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            stage.title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _tagColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _tagText(l10n),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: _tagColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stage.description,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.muted,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 12,
                          color: AppColors.teal700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          l10n.stageDuration(stage.duration),
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.teal700,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          stage.outcome,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.teal900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


