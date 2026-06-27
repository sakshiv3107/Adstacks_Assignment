import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/search_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/project_provider.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ],
      child: const AdstacksDashboardApp(),
    ),
  );
}

class AdstacksDashboardApp extends StatelessWidget {
  const AdstacksDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) => MaterialApp(
        title: 'Adstacks Dashboard',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
        home: const DashboardScreen(),
      ),
    );
  }
}
