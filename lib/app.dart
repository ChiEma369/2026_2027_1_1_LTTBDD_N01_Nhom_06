import 'package:flutter/material.dart';

import 'utils/app_theme.dart';

class TechTrailApp extends StatelessWidget {
  const TechTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTrail',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('TechTrail')),
        body: Center(
          child: Text(
            'xin chào',
            style: AppText.s(16, w: FontWeight.w500, color: AppColors.teal900),
          ),
        ),
      ),
    );
  }
}
