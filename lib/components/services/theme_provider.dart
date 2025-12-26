import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme Provider for managing app theme (light/dark mode)
class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;
  bool _isInitialized = false;

  ThemeMode get themeMode => _themeMode;

  /// Check if dark mode is active (accounts for system mode)
  bool isDarkMode(BuildContext? context) {
    if (_themeMode == ThemeMode.dark) return true;
    if (_themeMode == ThemeMode.light) return false;
    // For system mode, check the actual brightness
    if (context != null) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    // Fallback: assume light if context is not available
    return false;
  }

  /// Initialize theme from shared preferences
  Future<void> initializeTheme() async {
    if (_isInitialized) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedThemeMode = prefs.getString(_themeModeKey);
      
      if (savedThemeMode != null) {
        switch (savedThemeMode) {
          case 'light':
            _themeMode = ThemeMode.light;
            break;
          case 'dark':
            _themeMode = ThemeMode.dark;
            break;
          case 'system':
            _themeMode = ThemeMode.system;
            break;
        }
        notifyListeners();
      } else {
        // Default to system mode if no preference is saved
        _themeMode = ThemeMode.system;
      }
    } catch (e) {
      // If there's an error, use default system mode
      _themeMode = ThemeMode.system;
    }
    
    _isInitialized = true;
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    
    // Persist theme preference
    try {
      final prefs = await SharedPreferences.getInstance();
      String themeModeString;
      switch (mode) {
        case ThemeMode.light:
          themeModeString = 'light';
          break;
        case ThemeMode.dark:
          themeModeString = 'dark';
          break;
        case ThemeMode.system:
          themeModeString = 'system';
          break;
      }
      await prefs.setString(_themeModeKey, themeModeString);
    } catch (e) {
      // Silently fail if shared preferences is unavailable
    }
  }

  /// Toggle theme: cycles through system -> light -> dark -> system
  void toggleTheme() {
    switch (_themeMode) {
      case ThemeMode.system:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.system;
        break;
    }
    setThemeMode(_themeMode);
  }
  
  /// Get the current effective brightness (for system mode detection)
  Brightness? getEffectiveBrightness(BuildContext? context) {
    if (_themeMode == ThemeMode.dark) return Brightness.dark;
    if (_themeMode == ThemeMode.light) return Brightness.light;
    if (context != null) {
      return MediaQuery.of(context).platformBrightness;
    }
    return null;
  }
}

