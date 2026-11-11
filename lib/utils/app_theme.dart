import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Bảng màu Deep Sea Teal
  static const Color primaryDark = Color(0xFF0C3846); // Deep Sea Teal
  static const Color primary = Color(0xFF2A7387); // Arctic Ocean Blue
  static const Color secondary = Color(0xFF5EB0C8); // Cerulean Ripple
  static const Color accent = Color(0xFF9FD3E3); // Icy Glaze
  static const Color background = Color(0xFFE4F4F8);

  // đồng bộ tên cũ và mới
  static const Color deepSeaTeal = primaryDark;
  static const Color arcticOceanBlue = primary;
  static const Color ceruleanRipple = secondary;
  static const Color frostWhite = background;

  // Màu thành phần giao diện
  static const Color headerBg = Color(0xFF0C3846);
  static const Color card = Colors.white; // Nền Card trắng
  static const Color tagBg = Color(0xFFE8F4F7); // Nền Tag nhạt
  static const Color chipBg = Color(0xFF194A58);
  static const Color iconBoxBg = Color(0xFFDCEFF5);
  static const Color divider = Color(0xFFD3E6EC);
  // Nền Chip mờ trong Header

  // Màu chữ & Icon
  static const Color textPrimary = Color(0xFF0C3846);
  static const Color textMuted = Color(0xFF6B8B95); // Chữ phụ
  static const Color star = Color(0xFFFFB800);
  static const Color success = Color(0xFF2E7D32);
  static const Color stagePurple = Color(0xFF7C5CD6);
  static const Color stageOrange = Color(0xFFF08A24);

  static const LinearGradient mainGradient = LinearGradient(
    colors: [primaryDark, primary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
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
        secondary: AppColors.secondary,
        surface: AppColors.card,
        onSurface: AppColors.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: GoogleFonts.beVietnamPro(
          fontSize: 13,
          color: AppColors.textPrimary,
        ),
      ),
      dividerColor: AppColors.divider,
    );
  }
}
