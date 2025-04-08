import 'package:flutter/material.dart';
import 'package:vet_analytics/theme.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const VetApp());
}

class VetApp extends StatelessWidget {
  const VetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vet Analytics',
      theme: AppTheme.greenTheme,
      home: const IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}