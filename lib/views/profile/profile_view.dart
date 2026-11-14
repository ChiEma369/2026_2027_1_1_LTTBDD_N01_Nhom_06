import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/models/user_acc.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/data/repositories/auth_repository.dart';
import 'package:tech_trail/viewmodels/local_view_md.dart';

import 'it_profile_view.dart';

import 'package:tech_trail/widgets/profile/it_profile_card.dart';
import 'package:tech_trail/widgets/profile/dialogs/edit_profile_dialog.dart';
import 'package:tech_trail/widgets/profile/profile_header.dart';
import 'package:tech_trail/widgets/profile/personal_info_card.dart';
import 'package:tech_trail/widgets/profile/profile_action_buttons.dart';
import 'package:tech_trail/widgets/profile/group_info/group_info_card.dart';

import '../group_info/group_info_view.dart';

class ProfileView extends StatefulWidget {
  final VoidCallback onLogout;

  const ProfileView({super.key, required this.onLogout});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthRepository _repository = AuthRepository.instance;

  UserAccount? get _user => _repository.currentUser;

  Future<void> _editProfile() async {
    final user = _user;

    if (user == null) return;

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return EditProfileDialog(
          fullName: user.fullName,
          className: user.className ?? '',
          major: user.major ?? '',
        );
      },
    );

    if (!mounted || result == null) return;

    _repository.updateCurrentUser(
      fullName: result['fullName'],
      className: result['className'],
      major: result['major'],
    );

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).updateSuccess)),
    );
  }

  Future<void> _showLanguageDialog() async {
    final localeViewModel = context.read<LocaleViewModel>();
    final currentLanguage = localeViewModel.locale.languageCode;

    final selectedLanguage = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).selectLanguage),
          content: RadioGroup<String>(
            groupValue: currentLanguage,
            onChanged: (value) {
              if (value != null) {
                Navigator.pop(dialogContext, value);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  value: 'vi',
                  title: Text(AppLocalizations.of(dialogContext).vietnamese),
                ),
                RadioListTile<String>(
                  value: 'en',
                  title: Text(AppLocalizations.of(dialogContext).english),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selectedLanguage == null || !mounted) return;

    localeViewModel.setLocale(Locale(selectedLanguage));
  }

  void _logout() {
    // Xóa tài khoản đang đăng nhập
    AuthRepository.instance.logout();
    // Quay về màn hình đăng nhập
    widget.onLogout();
  }

  void _openItProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ItProfileView()),
    );
  }

  void _openGroupInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GroupInfoView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _user;

    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: Text(
            AppLocalizations.of(context).accountNotFound,
            textAlign: TextAlign.center,
            style: AppText.s(14, color: AppColors.muted),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                fullName: user.fullName,
                major:
                    user.major ??
                    AppLocalizations.of(context).profileMajorNotUpdated,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItProfileCard(onTap: _openItProfile),

                    const SizedBox(height: 12),

                    GroupInfoCard(onTap: _openGroupInfo),

                    const SizedBox(height: 22),

                    Text(
                      AppLocalizations.of(context).profileAccountInformation,
                      style: AppText.s(15, w: FontWeight.w700),
                    ),

                    const SizedBox(height: 12),

                    PersonalInfoCard(
                      fullName: user.fullName,
                      identifier: user.identifier,
                      className: user.className ?? '',
                      major: user.major ?? '',
                    ),

                    // Thẻ chọn ngôn ngữ
                    Builder(
                      builder: (context) {
                        final l10n = AppLocalizations.of(context);
                        final languageCode = Localizations.localeOf(context)
                            .languageCode;

                        final languageName = languageCode == 'vi'
                            ? l10n.vietnamese
                            : l10n.english;

                        return Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: _showLanguageDialog,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  // Icon ngôn ngữ
                                  Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: AppColors.teal700,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.language,
                                      color: Colors.white,
                                      size: 21,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  // Tên ngôn ngữ
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          l10n.language.toUpperCase(),
                                          style: AppText.s(
                                            9,
                                            w: FontWeight.w700,
                                            color: AppColors.muted,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          languageName,
                                          style: AppText.s(
                                            13,
                                            w: FontWeight.w600,
                                            color: AppColors.teal900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Mã ngôn ngữ
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.bg,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      languageCode.toUpperCase(),
                                      style: AppText.s(
                                        10,
                                        w: FontWeight.w700,
                                        color: AppColors.teal700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.muted,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 22),

                    ProfileActionButtons(
                      onEdit: _editProfile,
                      onLogout: _logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
