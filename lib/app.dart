import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/viewmodels/local_view_md.dart';
import 'package:tech_trail/data/repositories/career_map_repository.dart';
import 'package:tech_trail/views/auth/login_view.dart';
import 'package:tech_trail/data/repositories/activity_repository.dart';

import 'utils/app_theme.dart';

class TechTrailApp extends StatelessWidget {
  const TechTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CareerMapRepository>(
          create: (_) => CareerMapRepository(),
        ),
        ChangeNotifierProvider<ActivityRepository>(
          create: (_) => ActivityRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'TechTrail',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const LoginView(),
        onGenerateTitle: (context) =>
            AppLocalizations.of(context).appTitle,
        localizationsDelegates:
            AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: context.watch<LocaleViewModel>().locale,
      ),
    );
  }
}
