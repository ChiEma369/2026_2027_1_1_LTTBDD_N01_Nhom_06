import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/viewmodels/local_view_model.dart';
import 'package:tech_trail/views/career_map/career_map_screen.dart';

import 'utils/app_theme.dart';

class TechTrailApp extends StatelessWidget {
  const TechTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTrail',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const CareerMapScreen(),
      onGenerateTitle: (context) =>
          AppLocalizations.of(context).appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<LocaleViewModel>().locale,
    );
  }
}
