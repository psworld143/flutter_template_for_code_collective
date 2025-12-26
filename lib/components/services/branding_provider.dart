import 'package:flutter/material.dart';

/// Branding Provider for managing app branding and white-label customization
class BrandingProvider extends ChangeNotifier {
  // Company Branding
  String _companyName = 'My App';
  String _tagline = 'Your Business Partner';
  String? _logoPath;
  Widget? _logoWidget;

  // Colors
  Color _primaryColor = const Color(0xFF2563EB); // blue600
  Color _secondaryColor = const Color(0xFF4F46E5); // indigo600
  Color _accentColor = const Color(0xFF3B82F6); // blue500

  // Getters
  String get companyName => _companyName;
  String get tagline => _tagline;
  String? get logoPath => _logoPath;
  Widget? get logoWidget => _logoWidget;
  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;
  Color get accentColor => _accentColor;

  // Setters
  void setCompanyName(String name) {
    _companyName = name;
    notifyListeners();
  }

  void setTagline(String tagline) {
    _tagline = tagline;
    notifyListeners();
  }

  void setLogoPath(String? path) {
    _logoPath = path;
    notifyListeners();
  }

  void setLogoWidget(Widget? widget) {
    _logoWidget = widget;
    notifyListeners();
  }

  void setPrimaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  void setSecondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }

  void setAccentColor(Color color) {
    _accentColor = color;
    notifyListeners();
  }

  /// Get logo widget or default icon
  Widget getLogoWidget({double? maxHeight}) {
    if (_logoWidget != null) {
      return _logoWidget!;
    }
    if (_logoPath != null) {
      return Image.asset(
        _logoPath!,
        height: maxHeight,
        fit: BoxFit.contain,
      );
    }
    return Icon(
      Icons.business,
      size: maxHeight ?? 50,
      color: _primaryColor,
    );
  }
}

