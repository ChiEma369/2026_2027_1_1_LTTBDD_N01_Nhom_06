import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

class EditProfileDialog extends StatefulWidget {
  final String fullName;
  final String className;
  final String major;

  const EditProfileDialog({
    super.key,
    required this.fullName,
    required this.className,
    required this.major,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _classController;
  late final TextEditingController _majorController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.fullName);
    _classController = TextEditingController(text: widget.className);
    _majorController = TextEditingController(text: widget.major);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    _majorController.dispose();
    super.dispose();
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppText.s(12, color: AppColors.muted),
          filled: true,
          fillColor: AppColors.tealSoft,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.teal500),
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).profileFullNameRequired),
        ),
      );
      return;
    }

    Navigator.pop(context, <String, String>{
      'fullName': _nameController.text.trim(),
      'className': _classController.text.trim(),
      'major': _majorController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        AppLocalizations.of(context).profileEditButton,
        style: AppText.s(17, w: FontWeight.w700, color: AppColors.teal900),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildField(
              label: AppLocalizations.of(context).profileFullName,
              controller: _nameController,
            ),
            _buildField(
              label: AppLocalizations.of(context).profileEditClassLabel,
              controller: _classController,
            ),
            _buildField(
              label: AppLocalizations.of(context).profileMajor,
              controller: _majorController,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppLocalizations.of(context).profileCancel,
            style: AppText.s(12, color: AppColors.muted),
          ),
        ),
        ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.teal700,
            foregroundColor: AppColors.white,
          ),
          child: Text(
            AppLocalizations.of(context).profileSaveChanges,
            style: AppText.s(12, w: FontWeight.w600, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
