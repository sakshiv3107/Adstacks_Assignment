import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F6FA),
    cardColor: Colors.white,
    primaryColor: const Color(0xFF2D1B69),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6C63FF),
      secondary: Color(0xFF6C63FF),
      surface: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerColor: const Color(0xFFE5E7EB),
    fontFamily: 'Inter',
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D0D1A),
    cardColor: const Color(0xFF1A1A2E),
    primaryColor: const Color(0xFF6C63FF),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6C63FF),
      secondary: Color(0xFF6C63FF),
      surface: Color(0xFF1A1A2E),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1A1A2E),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerColor: const Color(0xFF2A2A3E),
    fontFamily: 'Inter',
    useMaterial3: true,
  );
}
