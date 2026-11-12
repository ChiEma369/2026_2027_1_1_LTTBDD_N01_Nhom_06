import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

class JournalRating extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onChanged;

  const JournalRating({
    super.key,
    required this.rating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mức độ hứng thú', style: AppText.s(12, w: FontWeight.w700)),
              Text(
                rating == 0 ? 'Chưa đánh giá' : '$rating/5 sao',
                style: AppText.s(
                  11,
                  color: AppColors.teal700,
                  w: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              final currentRating = index + 1;
              final selected = currentRating <= rating;

              return InkWell(
                onTap: () => onChanged(currentRating),
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.teal100 : AppColors.tealSoft,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected ? AppColors.teal500 : AppColors.divider,
                    ),
                  ),
                  child: Icon(
                    selected ? Icons.star : Icons.star_border,
                    color: selected ? AppColors.gold : AppColors.teal300,
                    size: 23,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
