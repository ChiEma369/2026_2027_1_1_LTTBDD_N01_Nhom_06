import 'package:flutter/material.dart';

import '../../widgets/navigation/app_bottom_navigation.dart';
import '../../utils/app_theme.dart';

import '../../views/career_map/career_map_screen.dart';
import '../../views/experience/experience_view.dart';
import '../../views/journal/journal_view.dart';
import '../../views/profile/profile_view.dart';
import '../../views/auth/login_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() =>
      _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 0;
  String? _selectedNicheId;
  List<Widget> get _pages => [
    CareerMapScreen(onOpenExperience: _openExperienceForNiche),
    ExperienceView(nicheId: _selectedNicheId),
    const JournalView(),
    ProfileView(onLogout: _handleLogout),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 1) {
        _selectedNicheId = null;
      }
    });
  }

  void _openExperienceForNiche(String nicheId) {
    setState(() {
      _selectedNicheId = nicheId;
      _currentIndex = 1;
    });
  }

  void _handleLogout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
