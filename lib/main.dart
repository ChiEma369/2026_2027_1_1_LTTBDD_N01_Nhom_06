import 'package:flutter/material.dart';

import 'views/navigation/main_navigation_view.dart';

void main() {
  runApp(const TechTrailApp());
}

class TechTrailApp extends StatelessWidget {
  const TechTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechTrail',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const MainNavigationView(),
    );
  }
}
