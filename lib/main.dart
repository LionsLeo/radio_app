import 'package:flutter/material.dart';
import 'package:radio_app/pages/frequency_selector/frequency_selector.dart';
import 'package:radio_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio App',
      themeMode: AppTheme.themeMode,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: const FrequencySelector(),
      debugShowCheckedModeBanner: false,
    );
  }
}
