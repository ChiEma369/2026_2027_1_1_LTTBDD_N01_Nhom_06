import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFFEBF7FA);
  static const white = Colors.white;
  static const teal900 = Color(0xFF0B3F4D);
  static const teal700 = Color(0xFF14677A);
  static const teal500 = Color(0xFF3A9BB3);
  static const teal300 = Color(0xFF8CCAD9);
  static const teal100 = Color(0xFFD8EEF3);
  static const tealSoft = Color(0xFFEAF6F9);
  static const text = Color(0xFF0B2F3A);
  static const muted = Color(0xFF6B8791);
  static const divider = Color(0xFFE6EFF2);
  static const green = Color(0xFF0E9F6E);
  static const goldBg = Color(0xFFFFF6DD);
  static const goldBorder = Color(0xFFF2DFA6);
  static const gold = Color(0xFFD98A00);
  static const goldDark = Color(0xFF8A5A00);
}

class AppText {
  static TextStyle s(
    double size, {
    FontWeight w = FontWeight.w400,
    Color color = AppColors.text,
    double? height,
    double? letterSpacing,
  }) => GoogleFonts.beVietnamPro(
    fontSize: size,
    fontWeight: w,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  );
}

class AppShadows {
  static final card = [
    BoxShadow(
      color: AppColors.teal700.withValues(alpha: 0.08),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal500,
        primary: AppColors.teal700,
        surface: AppColors.white,
        onSurface: AppColors.text,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.teal700,
        foregroundColor: AppColors.white,
        centerTitle: true,
        titleTextStyle: AppText.s(
          18,
          w: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      dividerColor: AppColors.divider,
    );
  }
}
