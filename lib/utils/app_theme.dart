import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const deepSeaTeal = Color(0xFF0C3846);
  static const arcticOceanBlue = Color(0xFF2A7387);
  static const ceruleanRipple = Color(0xFF5EB0C8);
  static const icyGlaze = Color(0xFF9FD3E3);
  static const frostWhite = Color(0xFFE4F4F8);

  static const primary = arcticOceanBlue;
  static const primaryDark = deepSeaTeal;
  static const background = frostWhite;
  static const card = Colors.white;

  static const headerBg = icyGlaze;
  static const chipBg = icyGlaze;
  static const tagBg = frostWhite;

  static const textPrimary = deepSeaTeal;
  static const textMuted = Color(0xFF5A7882);
  static const divider = Color(0xFFD0E6ED);

  static const star = Color(0xFFF2A516);
  static const success = Color(0xFF2E9E6B);
}

class AppText {
  static TextStyle s(
    double size, {
    FontWeight w = FontWeight.w400,
    Color color = AppColors.textPrimary,
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
      color: AppColors.deepSeaTeal.withValues(alpha: 0.08),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.ceruleanRipple,
        surface: AppColors.card,
        onSurface: AppColors.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.deepSeaTeal,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.beVietnamPro(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.beVietnamPro(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chipBg,
        selectedColor: AppColors.primary,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        labelStyle: GoogleFonts.beVietnamPro(
          fontSize: 13,
          color: AppColors.textPrimary,
        ),
      ),
      dividerColor: AppColors.divider,
    );
  }
}
