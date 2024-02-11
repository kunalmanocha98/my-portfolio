import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';

class TextStyles {
  static TextStyle headingStyle= GoogleFonts.poppins(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: AppColors.appPrimaryTextColorDark
  );

  static TextStyle descriptionStyle= GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.appSecondaryTextColorDark,
  );

  static TextStyle buttonStyle= GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.appPrimaryTextColorLight
  );

  static TextStyle titleStyle= GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.appSecondaryTextColorDark,
      letterSpacing: 4,
  );

  static TextStyle moduleTitleStyle= GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w900,
    color: AppColors.appSecondaryTextColorDark,
    letterSpacing: 5,
  );

  static TextStyle projectTitleStyle= GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.appWhiteColor,
  );

  static TextStyle expTitleStyle= GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.appPrimaryTextColorDark,
  );

  static TextStyle expDescStyle= GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.appSecondaryTextColorDark,
  );

  static TextStyle expDateStyle= GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.appTernaryTextColorDark,
  );
}