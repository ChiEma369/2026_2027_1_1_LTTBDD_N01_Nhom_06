import 'package:flutter/material.dart';

import '../../widgets/app_bottom_navigation.dart';
import '../../utils/app_colors.dart';

import '../home/career_map_view.dart';
import '../experience/experience_view.dart';
import '../journal/journal_view.dart';
import '../profile/profile_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    CareerMapView(),
    ExperienceView(),
    JournalView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
