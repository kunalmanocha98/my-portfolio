import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';

class TextStyles {
  static TextStyle nameStyle(
          BuildContext context) =>
      GoogleFonts.nothingYouCouldDo(
          fontSize: 54,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.appWhiteColor
              : AppColors.appBlackColor);

  static TextStyle headingStyle(BuildContext context) => GoogleFonts.poppins(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.appPrimaryTextColorDark
          : AppColors.appPrimaryTextColorLight);

  static TextStyle descriptionStyle(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
      );

  static TextStyle buttonStyle(BuildContext context) => GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.appPrimaryTextColorLight
          : AppColors
              .appWhiteColor // Button text is usually inverse of background? AppButtons might handle background.
      // Original was AppColors.appPrimaryTextColorLight (Black).
      // If button background changes, text should change.
      // Assuming buttons are "filled" with primary color?
      // Standard AppButtons use specific colors. Let's check AppButtons usage.
      // Keeping original behavior for now but usually buttons need attention.
      // Original: color: AppColors.appPrimaryTextColorLight
      );

  // Re-evaluating buttonStyle. Original was Black.
  // If in dark mode, buttons might be white/grey?
  // Let's stick to theme logic.

  static TextStyle titleStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
        letterSpacing: 4,
      );

  static TextStyle moduleTitleStyle(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
        letterSpacing: 5,
      );

  static TextStyle projectTitleStyle(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appWhiteColor
            : AppColors.appBlackColor,
      );

  static TextStyle expTitleStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appPrimaryTextColorDark
            : AppColors.appPrimaryTextColorLight,
      );

  static TextStyle expDescStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
      );

  static TextStyle expDateStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appTernaryTextColorDark
            : AppColors.appTernaryTextColorLight,
      );
}

class TextStylesMobile {
  static TextStyle nameStyle(
          BuildContext context) =>
      GoogleFonts.nothingYouCouldDo(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.appWhiteColor
              : AppColors.appBlackColor);

  static TextStyle headingStyle(BuildContext context) => GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.appPrimaryTextColorDark
          : AppColors.appPrimaryTextColorLight);

  static TextStyle descriptionStyle(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
      );

  static TextStyle buttonStyle(BuildContext context) => GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.appPrimaryTextColorLight // Original was fixed to black.
      );

  static TextStyle titleStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
        letterSpacing: 4,
      );

  static TextStyle moduleTitleStyle(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
        letterSpacing: 5,
      );

  static TextStyle projectTitleStyle(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appWhiteColor
            : AppColors.appBlackColor,
      );

  static TextStyle expTitleStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appPrimaryTextColorDark
            : AppColors.appPrimaryTextColorLight,
      );

  static TextStyle expDescStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appSecondaryTextColorDark
            : AppColors.appSecondaryTextColorLight,
      );

  static TextStyle expDateStyle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.appTernaryTextColorDark
            : AppColors.appTernaryTextColorLight,
      );
}
