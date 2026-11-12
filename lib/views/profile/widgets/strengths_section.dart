import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

class StrengthsSection extends StatelessWidget {
  final List<String> strengths;

  const StrengthsSection({super.key, required this.strengths});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppShadows.card,
      ),
      child: Wrap(
        spacing: 9,
        runSpacing: 9,
        children: strengths.map((strength) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: AppColors.tealSoft,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.green,
                  size: 15,
                ),
                const SizedBox(width: 6),
                Text(strength, style: AppText.s(11, w: FontWeight.w500)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
