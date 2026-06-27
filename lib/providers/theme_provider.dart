import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get currentTheme => _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
