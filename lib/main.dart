import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/viewmodels/local_view_model.dart';
import 'package:tech_trail/app.dart';
import 'package:tech_trail/data/repositories/app_repository.dart';

import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AppRepository>(create: (_) => AppRepository()),
        ChangeNotifierProvider(create: (_) => LocaleViewModel()),
      ],
      child: const TechTrailApp(),
    ),
  );
}
