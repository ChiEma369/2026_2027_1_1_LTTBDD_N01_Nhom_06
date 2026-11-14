import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/utils/app_theme.dart';

class JournalDifficulty extends StatelessWidget {
  final Difficulty? difficulty;
  final ValueChanged<Difficulty> onChanged;

  const JournalDifficulty({
    super.key,
    required this.difficulty,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final options = [
      (
        Difficulty.easy,
        l10n.journalDifficultyEasy,
        l10n.journalDifficultyEasyDescription,
      ),
      (
        Difficulty.fit,
        l10n.journalDifficultyFit,
        l10n.journalDifficultyFitDescription,
      ),
      (
        Difficulty.hard,
        l10n.journalDifficultyHard,
        l10n.journalDifficultyHardDescription,
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.journalDifficultyTitle,
            style: AppText.s(14, w: FontWeight.w700),
          ),
          const SizedBox(height: 10),

          ...options.map((option) {
            final selected = difficulty == option.$1;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: () => onChanged(option.$1),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.teal100 : AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected ? AppColors.teal500 : AppColors.divider,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option.$2,
                              style: AppText.s(12, w: FontWeight.w700),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              option.$3,
                              style: AppText.s(10, color: AppColors.muted),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        selected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: AppColors.teal500,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
