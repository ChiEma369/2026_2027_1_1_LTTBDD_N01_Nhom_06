import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Màu hiện có của dự án
  static const Color primary = Color(0xFF146579);
  static const Color secondary = Color(0xFF299DB5);

  static const Color background = Color(0xFFF1F8FA);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF244653);
  static const Color textSecondary = Color(0xFF78909C);

  static const Color border = Color(0xFFDCEBF0);
  static const Color selected = Color(0xFF299DB5);
  static const Color unselected = Color(0xFF9BAFBB);

  // Các tên màu bổ sung cho giao diện Auth
  static const Color bg = background;
  static const Color white = surface;

  static const Color teal900 = Color(0xFF0B3F4D);
  static const Color teal700 = primary;
  static const Color teal500 = secondary;
  static const Color teal300 = Color(0xFF8CCAD9);
  static const Color teal100 = Color(0xFFD8EEF3);
  static const Color tealSoft = Color(0xFFEAF6F9);

  static const Color text = textPrimary;
  static const Color muted = textSecondary;
  static const Color divider = border;

  static const Color green = Color(0xFF0E9F6E);

  static const Color goldBg = Color(0xFFFFF6DD);
  static const Color goldBorder = Color(0xFFF2DFA6);
  static const Color gold = Color(0xFFD98A00);
  static const Color goldDark = Color(0xFF8A5A00);
}

// Cấu hình chữ dùng chung
class AppText {
  static TextStyle s(
    double size, {
    FontWeight w = FontWeight.w400,
    Color color = AppColors.text,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.beVietnamPro(
      fontSize: size,
      fontWeight: w,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}

// Hiệu ứng đổ bóng dùng chung
class AppShadows {
  static final List<BoxShadow> card = [
    BoxShadow(
      color: AppColors.teal700.withValues(alpha: 0.08),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}

// Theme chung của ứng dụng
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

      textTheme: GoogleFonts.beVietnamProTextTheme(),

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
