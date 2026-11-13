import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

import 'locale_provider.dart';
import 'utils/app_theme.dart';
import 'views/auth/login_view.dart';

class TechTrailApp extends StatelessWidget {
  const TechTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          title: 'TechTrail',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,

          locale: localeProvider.locale,

          supportedLocales: AppLocalizations.supportedLocales,

          localizationsDelegates: AppLocalizations.localizationsDelegates,

          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,

          home: const LoginView(),
        );
      },
    );
  }
}
