import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF8360F0);
  static const Color primaryLight = Color(0xFFB39DF9);
  static const Color scaffoldBg = Color(0xFFFFFFFF);
  static const Color fieldBg = Color(0xFFF5F5F9);
  static const Color textDark = Color(0xFF1D1E2C);
  static const Color textGrey = Color(0xFF9796A1);
  static const Color success = Color(0xFF2ED573);
  static const Color facebook = Color(0xFF3B5998);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color google = Color(0xFFEA4335);
}

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    color: AppColors.textGrey,
  );

  static const TextStyle label = TextStyle(
    fontSize: 15,
    color: AppColors.textGrey,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );
}
