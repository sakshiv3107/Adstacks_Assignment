import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const AdstacksDashboardApp());
}

class AdstacksDashboardApp extends StatelessWidget {
  const AdstacksDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adstacks Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const DashboardScreen(),
    );
  }
}
