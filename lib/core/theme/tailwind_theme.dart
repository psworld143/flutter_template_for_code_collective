import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tailwind CSS-inspired theme for Flutter
/// A utility-first design system with modern colors and components
class TailwindTheme {
  // ==================== COLORS ====================

  // Slate (Neutral grays)
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate950 = Color(0xFF020617);

  // Blue
  static const Color blue50 = Color(0xFFEFF6FF);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue900 = Color(0xFF1E3A8A);
  static const Color blue950 = Color(0xFF172554);

  // Emerald (Green)
  static const Color emerald50 = Color(0xFFECFDF5);
  static const Color emerald100 = Color(0xFFD1FAE5);
  static const Color emerald200 = Color(0xFFA7F3D0);
  static const Color emerald300 = Color(0xFF6EE7B7);
  static const Color emerald400 = Color(0xFF34D399);
  static const Color emerald500 = Color(0xFF10B981);
  static const Color emerald600 = Color(0xFF059669);
  static const Color emerald700 = Color(0xFF047857);
  static const Color emerald800 = Color(0xFF065F46);
  static const Color emerald900 = Color(0xFF064E3B);
  static const Color emerald950 = Color(0xFF022C22);

  // Amber (Orange/Yellow)
  static const Color amber50 = Color(0xFFFFFBEB);
  static const Color amber100 = Color(0xFFFEF3C7);
  static const Color amber200 = Color(0xFFFDE68A);
  static const Color amber300 = Color(0xFFFCD34D);
  static const Color amber400 = Color(0xFFFBBF24);
  static const Color amber500 = Color(0xFFF59E0B);
  static const Color amber600 = Color(0xFFD97706);
  static const Color amber700 = Color(0xFFB45309);
  static const Color amber800 = Color(0xFF92400E);
  static const Color amber900 = Color(0xFF78350F);
  static const Color amber950 = Color(0xFF451A03);

  // Red
  static const Color red50 = Color(0xFFFEF2F2);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red400 = Color(0xFFF87171);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red900 = Color(0xFF7F1D1D);
  static const Color red950 = Color(0xFF450A0A);

  // Indigo
  static const Color indigo50 = Color(0xFFEEF2FF);
  static const Color indigo100 = Color(0xFFE0E7FF);
  static const Color indigo200 = Color(0xFFC7D2FE);
  static const Color indigo300 = Color(0xFFA5B4FC);
  static const Color indigo400 = Color(0xFF818CF8);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color indigo600 = Color(0xFF4F46E5);
  static const Color indigo700 = Color(0xFF4338CA);
  static const Color indigo800 = Color(0xFF3730A3);
  static const Color indigo900 = Color(0xFF312E81);
  static const Color indigo950 = Color(0xFF1E1B4B);

  // Purple
  static const Color purple50 = Color(0xFFFAF5FF);
  static const Color purple100 = Color(0xFFF3E8FF);
  static const Color purple200 = Color(0xFFE9D5FF);
  static const Color purple300 = Color(0xFFD8B4FE);
  static const Color purple400 = Color(0xFFC084FC);
  static const Color purple500 = Color(0xFFA855F7);
  static const Color purple600 = Color(0xFF9333EA);
  static const Color purple700 = Color(0xFF7E22CE);
  static const Color purple800 = Color(0xFF6B21A8);
  static const Color purple900 = Color(0xFF581C87);
  static const Color purple950 = Color(0xFF3B0764);

  // ==================== SPACING ====================
  static const double spacing0 = 0;
  static const double spacing1 = 4;
  static const double spacing2 = 8;
  static const double spacing3 = 12;
  static const double spacing4 = 16;
  static const double spacing5 = 20;
  static const double spacing6 = 24;
  static const double spacing8 = 32;
  static const double spacing10 = 40;
  static const double spacing12 = 48;
  static const double spacing16 = 64;
  static const double spacing20 = 80;
  static const double spacing24 = 96;

  // ==================== BORDER RADIUS ====================
  static const double roundedNone = 0;
  static const double roundedSm = 4;
  static const double rounded = 8;
  static const double roundedMd = 12;
  static const double roundedLg = 16;
  static const double roundedXl = 20;
  static const double rounded2xl = 24;
  static const double rounded3xl = 32;
  static const double roundedFull = 9999;

  // ==================== SHADOWS ====================
  // Light mode shadows
  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: slate900.withOpacity(0.05),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get shadow => [
        BoxShadow(
          color: slate900.withOpacity(0.1),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: slate900.withOpacity(0.06),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: slate900.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: slate900.withOpacity(0.06),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: slate900.withOpacity(0.1),
          blurRadius: 15,
          offset: const Offset(0, 10),
        ),
        BoxShadow(
          color: slate900.withOpacity(0.04),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get shadowXl => [
        BoxShadow(
          color: slate900.withOpacity(0.1),
          blurRadius: 25,
          offset: const Offset(0, 20),
        ),
        BoxShadow(
          color: slate900.withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get shadow2xl => [
        BoxShadow(
          color: slate900.withOpacity(0.25),
          blurRadius: 50,
          offset: const Offset(0, 25),
        ),
      ];

  // Dark mode shadows (lighter shadows for dark backgrounds)
  static List<BoxShadow> get shadowSmDark => [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get shadowDark => [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get shadowMdDark => [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowLgDark => [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 15,
          offset: const Offset(0, 10),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get shadowXlDark => [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 25,
          offset: const Offset(0, 20),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get shadow2xlDark => [
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          blurRadius: 50,
          offset: const Offset(0, 25),
        ),
      ];

  // ==================== TYPOGRAPHY ====================

  // Text Sizes - Using Google Poppins font
  static TextStyle get textXs => GoogleFonts.poppins(
        fontSize: 12,
        height: 1.5,
      );

  static TextStyle get textSm => GoogleFonts.poppins(
        fontSize: 14,
        height: 1.5,
      );

  static TextStyle get textBase => GoogleFonts.poppins(
        fontSize: 16,
        height: 1.5,
      );

  static TextStyle get textLg => GoogleFonts.poppins(
        fontSize: 18,
        height: 1.5,
      );

  static TextStyle get textXl => GoogleFonts.poppins(
        fontSize: 20,
        height: 1.5,
      );

  static TextStyle get text2xl => GoogleFonts.poppins(
        fontSize: 24,
        height: 1.4,
      );

  static TextStyle get text3xl => GoogleFonts.poppins(
        fontSize: 30,
        height: 1.3,
      );

  static TextStyle get text4xl => GoogleFonts.poppins(
        fontSize: 36,
        height: 1.2,
      );

  static TextStyle get text5xl => GoogleFonts.poppins(
        fontSize: 48,
        height: 1.1,
      );

  static TextStyle get text6xl => GoogleFonts.poppins(
        fontSize: 60,
        height: 1,
      );

  // Font Weights
  static FontWeight get fontThin => FontWeight.w100;
  static FontWeight get fontExtralight => FontWeight.w200;
  static FontWeight get fontLight => FontWeight.w300;
  static FontWeight get fontNormal => FontWeight.w400;
  static FontWeight get fontMedium => FontWeight.w500;
  static FontWeight get fontSemibold => FontWeight.w600;
  static FontWeight get fontBold => FontWeight.w700;
  static FontWeight get fontExtrabold => FontWeight.w800;
  static FontWeight get fontBlack => FontWeight.w900;

  // ==================== COMPATIBILITY ALIASES ====================
  // Color aliases
  static Color get primaryBlue => blue600;
  static Color get primaryGreen => emerald600;
  static Color get accentBlue => blue500;
  static Color get accentGreen => emerald500;
  static Color get darkBlue => blue800;
  static Color get darkGreen => emerald800;
  static Color get lightBlue => blue100;
  static Color get lightGreen => emerald100;
  static Color get darkGray => slate900;
  static Color get mediumGray => slate500;
  static Color get lightGray => slate100;
  static Color get error => red600;
  static Color get success => emerald600;
  static Color get warning => amber600;
  static Color get info => blue600;

  // Typography aliases
  static TextStyle get heading1 => text4xl.copyWith(fontWeight: fontBold);
  static TextStyle get heading2 => text2xl.copyWith(fontWeight: fontSemibold);
  static TextStyle get heading3 => textXl.copyWith(fontWeight: fontSemibold);
  static TextStyle get heading4 => textLg.copyWith(fontWeight: fontSemibold);
  static TextStyle get heading5 => textBase.copyWith(fontWeight: fontSemibold);
  static TextStyle get heading6 => textSm.copyWith(fontWeight: fontSemibold);
  static TextStyle get bodyLarge => textBase;
  static TextStyle get bodyMedium => textSm;
  static TextStyle get bodySmall => textXs;

  // ==================== GRADIENTS ====================
  static LinearGradient get gradientBlueToPurple => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [blue600, purple600],
      );

  static LinearGradient get gradientBlueToIndigo => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [blue500, indigo600],
      );

  static LinearGradient get gradientEmeraldToBlue => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [emerald500, blue600],
      );

  // ==================== THEME DATA ====================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamilyFallback: const ['Noto Sans', 'Roboto', 'Arial'],
      colorScheme: ColorScheme.fromSeed(
        seedColor: blue600,
        brightness: Brightness.light,
        primary: blue600,
        secondary: indigo600,
        tertiary: purple600,
        error: red600,
        surface: slate50,
        background: slate50,
      ),
      scaffoldBackgroundColor: slate50,
      cardColor: Colors.white,
      textTheme: TextTheme(
        displayLarge: text5xl.copyWith(
          color: slate900,
          fontWeight: fontBold,
        ),
        displayMedium: text4xl.copyWith(
          color: slate900,
          fontWeight: fontBold,
        ),
        displaySmall: text3xl.copyWith(
          color: slate900,
          fontWeight: fontSemibold,
        ),
        headlineLarge: text2xl.copyWith(
          color: slate900,
          fontWeight: fontSemibold,
        ),
        headlineMedium: textXl.copyWith(
          color: slate900,
          fontWeight: fontSemibold,
        ),
        headlineSmall: textLg.copyWith(
          color: slate900,
          fontWeight: fontSemibold,
        ),
        titleLarge: textLg.copyWith(
          color: slate900,
          fontWeight: fontMedium,
        ),
        titleMedium: textBase.copyWith(
          color: slate900,
          fontWeight: fontMedium,
        ),
        titleSmall: textSm.copyWith(
          color: slate700,
          fontWeight: fontMedium,
        ),
        bodyLarge: textBase.copyWith(
          color: slate700,
        ),
        bodyMedium: textSm.copyWith(
          color: slate600,
        ),
        bodySmall: textXs.copyWith(
          color: slate500,
        ),
        labelLarge: textSm.copyWith(
          color: slate900,
          fontWeight: fontMedium,
        ),
        labelMedium: textXs.copyWith(
          color: slate600,
          fontWeight: fontMedium,
        ),
        labelSmall: textXs.copyWith(
          color: slate500,
          fontWeight: fontMedium,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue600,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: spacing4,
            vertical: spacing3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedMd),
          ),
          textStyle: textSm.copyWith(
            fontWeight: fontMedium,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: slate700,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: spacing4,
            vertical: spacing3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedMd),
          ),
          side: const BorderSide(color: slate300, width: 1),
          textStyle: textSm.copyWith(
            fontWeight: fontMedium,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: blue600,
          padding: const EdgeInsets.symmetric(
            horizontal: spacing3,
            vertical: spacing2,
          ),
          textStyle: textSm.copyWith(
            fontWeight: fontMedium,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: slate300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: slate300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: blue600, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: red600),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacing4,
          vertical: spacing3,
        ),
        labelStyle: textSm.copyWith(color: slate600),
        hintStyle: textSm.copyWith(color: slate400),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedXl),
          side: const BorderSide(color: slate200, width: 1),
        ),
        margin: EdgeInsets.zero,
        color: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: slate900,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textXl.copyWith(
          color: slate900,
          fontWeight: fontSemibold,
        ),
        iconTheme: const IconThemeData(color: slate700),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: slate100,
        labelStyle: textXs.copyWith(
          color: slate700,
          fontWeight: fontMedium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: spacing2,
          vertical: spacing1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rounded),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: slate200,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // ==================== DARK THEME ====================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamilyFallback: const ['Noto Sans', 'Roboto', 'Arial'],
      colorScheme: ColorScheme.fromSeed(
        seedColor: blue500,
        brightness: Brightness.dark,
        primary: blue500,
        secondary: indigo500,
        tertiary: purple500,
        error: red500,
        surface: slate900,
        background: slate950,
      ),
      scaffoldBackgroundColor: slate950,
      cardColor: slate900,
      textTheme: TextTheme(
        displayLarge: text5xl.copyWith(
          color: slate50,
          fontWeight: fontBold,
        ),
        displayMedium: text4xl.copyWith(
          color: slate50,
          fontWeight: fontBold,
        ),
        displaySmall: text3xl.copyWith(
          color: slate50,
          fontWeight: fontSemibold,
        ),
        headlineLarge: text2xl.copyWith(
          color: slate50,
          fontWeight: fontSemibold,
        ),
        headlineMedium: textXl.copyWith(
          color: slate50,
          fontWeight: fontSemibold,
        ),
        headlineSmall: textLg.copyWith(
          color: slate100,
          fontWeight: fontSemibold,
        ),
        titleLarge: textLg.copyWith(
          color: slate100,
          fontWeight: fontMedium,
        ),
        titleMedium: textBase.copyWith(
          color: slate200,
          fontWeight: fontMedium,
        ),
        titleSmall: textSm.copyWith(
          color: slate300,
          fontWeight: fontMedium,
        ),
        bodyLarge: textBase.copyWith(
          color: slate300,
        ),
        bodyMedium: textSm.copyWith(
          color: slate400,
        ),
        bodySmall: textXs.copyWith(
          color: slate500,
        ),
        labelLarge: textSm.copyWith(
          color: slate200,
          fontWeight: fontMedium,
        ),
        labelMedium: textXs.copyWith(
          color: slate400,
          fontWeight: fontMedium,
        ),
        labelSmall: textXs.copyWith(
          color: slate500,
          fontWeight: fontMedium,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue600,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: spacing4,
            vertical: spacing3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedMd),
          ),
          textStyle: textSm.copyWith(
            fontWeight: fontMedium,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: slate300,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: spacing4,
            vertical: spacing3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedMd),
          ),
          side: const BorderSide(color: slate700, width: 1),
          textStyle: textSm.copyWith(
            fontWeight: fontMedium,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: blue500,
          padding: const EdgeInsets.symmetric(
            horizontal: spacing3,
            vertical: spacing2,
          ),
          textStyle: textSm.copyWith(
            fontWeight: fontMedium,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: slate900,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: slate700),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: slate700),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: blue500, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedMd),
          borderSide: const BorderSide(color: red500),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacing4,
          vertical: spacing3,
        ),
        labelStyle: textSm.copyWith(color: slate400),
        hintStyle: textSm.copyWith(color: slate600),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedXl),
          side: const BorderSide(color: slate800, width: 1),
        ),
        margin: EdgeInsets.zero,
        color: slate900,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: slate900,
        foregroundColor: slate50,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textXl.copyWith(
          color: slate50,
          fontWeight: fontSemibold,
        ),
        iconTheme: const IconThemeData(color: slate300),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: slate800,
        labelStyle: textXs.copyWith(
          color: slate300,
          fontWeight: fontMedium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: spacing2,
          vertical: spacing1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rounded),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: slate800,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

