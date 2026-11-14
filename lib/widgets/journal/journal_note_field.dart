import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/utils/app_theme.dart';

class JournalNoteField extends StatelessWidget {
  final TextEditingController controller;

  const JournalNoteField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
          Text(l10n.journalNoteTitle, style: AppText.s(14, w: FontWeight.w700)),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            maxLength: 150,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: l10n.journalNoteHint,
              hintStyle: AppText.s(11, color: AppColors.muted),
              filled: true,
              fillColor: AppColors.tealSoft,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              counterStyle: AppText.s(10, color: AppColors.muted),
            ),
            style: AppText.s(12),
          ),
        ],
      ),
    );
  }
}
