import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';

class JournalSubmitButton extends StatelessWidget {
  final bool isSubmitting;
  final VoidCallback onPressed;

  const JournalSubmitButton({
    super.key,
    required this.isSubmitting,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isSubmitting ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.teal900,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: isSubmitting
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'GỬI PHẢN HỒI  →',
                style: AppText.s(
                  13,
                  w: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
