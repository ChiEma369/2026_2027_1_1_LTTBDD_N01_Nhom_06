import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'views/auth/login_view.dart';

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
      theme: AppTheme.lightTheme,
      home: const LoginView(),
    );
  }
}
