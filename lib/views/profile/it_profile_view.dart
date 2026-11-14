import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/data/repositories/auth_repository.dart';
import 'package:tech_trail/models/user_acc.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ItProfileView extends StatelessWidget {
  const ItProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserAccount? user = AuthRepository.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header IT Profile
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 25),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.teal900, AppColors.teal700],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 42,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.white,
                              size: 19,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context).itProfileTitle,
                              textAlign: TextAlign.center,
                              style: AppText.s(
                                18,
                                w: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CircleAvatar(
                      radius: 29,
                      backgroundColor: AppColors.teal300,
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: AppColors.teal900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user?.fullName ??
                          AppLocalizations.of(context).itProfileDefaultName,
                      style: AppText.s(
                        16,
                        w: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      AppLocalizations.of(context).itProfileSubtitle,
                      textAlign: TextAlign.center,
                      style: AppText.s(10, color: AppColors.teal100),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle(
                      AppLocalizations.of(context).itProfileCareerDirection,
                      Icons.explore_outlined,
                    ),
                    _emptyCard(
                      AppLocalizations.of(context)
                          .itProfileCareerDirectionEmpty,
                    ),

                    const SizedBox(height: 22),

                    _sectionTitle(
                      AppLocalizations.of(context).itProfileAssessmentResult,
                      Icons.analytics_outlined,
                    ),
                    _emptyCard(
                      AppLocalizations.of(context).itProfileAssessmentEmpty,
                    ),

                    const SizedBox(height: 22),

                    _sectionTitle(
                      AppLocalizations.of(context).itProfileStrengths,
                      Icons.stars_outlined,
                    ),
                    _emptyCard(
                      AppLocalizations.of(context).itProfileStrengthsEmpty,
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

  static Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.teal700, size: 20),
          const SizedBox(width: 8),
          Text(title, style: AppText.s(15, w: FontWeight.w700)),
        ],
      ),
    );
  }

  static Widget _emptyCard(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppShadows.card,
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: AppText.s(12, color: AppColors.muted, height: 1.5),
      ),
    );
  }
}
