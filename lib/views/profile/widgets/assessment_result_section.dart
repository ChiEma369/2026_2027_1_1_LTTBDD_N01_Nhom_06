import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

import '../models/assessment_result.dart';

class AssessmentResultSection extends StatelessWidget {
  final List<AssessmentResult> results;

  const AssessmentResultSection({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: results.map((result) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: AppShadows.card,
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.tealSoft,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(result.icon, color: AppColors.teal700, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(result.name, style: AppText.s(13, w: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Text(
                      result.description,
                      style: AppText.s(11, color: AppColors.muted),
                    ),
                  ],
                ),
              ),
              Text(
                '${result.score.toStringAsFixed(1)}/5',
                style: AppText.s(
                  14,
                  w: FontWeight.w700,
                  color: AppColors.teal700,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
