import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData? light = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.kBackColor1,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      hintStyle: AppTextStyles.kHomeSearch,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(350, 60),
        backgroundColor: AppColors.kPrimaryColor,
        textStyle: AppTextStyles.kButtonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.kButtonText,
      ),
    ),
  );
}
