import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

import 'journal_statistics.dart';

class JournalHeader extends StatelessWidget {
  final int activityCount;
  final int completedCount;

  const JournalHeader({
    super.key,
    required this.activityCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Nhật ký thực chiến',
                  style: AppText.s(
                    19,
                    w: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Ghi lại trải nghiệm – Kiến tạo định hướng',
            style: AppText.s(11, color: AppColors.teal100),
          ),
          const SizedBox(height: 20),
          JournalStatistics(
            activityCount: activityCount,
            completedCount: completedCount,
          ),
        ],
      ),
    );
  }
}
