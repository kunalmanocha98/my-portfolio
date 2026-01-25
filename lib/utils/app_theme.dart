import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.appBackGroundColorLight, // white
    colorScheme: const ColorScheme.light(
      primary: AppColors.appBlackColor,
      surface: AppColors.appBackGroundColorLight,
      onSurface: AppColors.appPrimaryTextColorLight,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.appPrimaryTextColorLight),
      bodyLarge:
          TextStyle(color: AppColors.appPrimaryTextColorLight), // primary text
      bodySmall: TextStyle(
          color: AppColors.appSecondaryTextColorLight), // secondary text
    ),
    // Define other theme properties as needed mapping from AppColors
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.appBackGroundColorDark, // black
    colorScheme: const ColorScheme.dark(
      primary: AppColors.appWhiteColor,
      surface: AppColors.appBackGroundColorDark,
      onSurface: AppColors.appPrimaryTextColorDark,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.appPrimaryTextColorDark),
      bodyLarge: TextStyle(color: AppColors.appPrimaryTextColorDark),
      bodySmall: TextStyle(color: AppColors.appSecondaryTextColorDark),
    ),
  );
}
