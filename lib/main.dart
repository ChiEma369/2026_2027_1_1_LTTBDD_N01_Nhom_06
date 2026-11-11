import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/viewmodels/local_view_md.dart';
import 'package:tech_trail/app.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LocaleViewModel())],
      child: const TechTrailApp(),
    ),
  );
}
