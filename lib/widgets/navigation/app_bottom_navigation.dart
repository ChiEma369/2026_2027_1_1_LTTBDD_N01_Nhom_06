import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

import '../../utils/app_theme.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.divider, width: 1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.teal900.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.map_outlined),
              activeIcon: const Icon(Icons.map_rounded),
              label: l10n.tabCareerMap,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.play_circle_outline),
              activeIcon: const Icon(Icons.play_circle),
              label: l10n.tabActivities,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.bookmark_border),
              activeIcon: const Icon(Icons.bookmark),
              label: l10n.tabJournal,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              activeIcon: const Icon(Icons.person),
              label: l10n.tabProfile,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,

          selectedItemColor: AppColors.teal700,
          unselectedItemColor: AppColors.muted,

          selectedFontSize: 9,
          unselectedFontSize: 9,
          iconSize: 20,

          selectedLabelStyle: AppText.s(
            9,
            w: FontWeight.w600,
            color: AppColors.teal700,
          ),

          unselectedLabelStyle: AppText.s(9, color: AppColors.muted),

          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
