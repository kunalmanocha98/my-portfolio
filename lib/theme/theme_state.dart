import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

abstract class ThemeState extends Equatable{}
class LightThemeState extends ThemeState{
  final themeData = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: Colors.transparent),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.nothingYouCouldDo(
          fontSize: 54,
          fontWeight: FontWeight.bold,
          color: AppColors.appBlackColor
      ),
      displayMedium: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.appPrimaryTextColorLight
      ),
      // displaySmall: ,
      // headlineLarge: ,
      // headlineMedium: ,
      // headlineSmall: ,
      // titleLarge: ,
      // titleMedium: ,
      // titleSmall: ,
      // bodyLarge: ,
      // bodyMedium: ,
      // bodySmall: ,
      // labelLarge: ,
      // labelMedium: ,
      // labelSmall: ,
    )
  );
  final themeMode = ThemeMode.light;
  @override
  List<Object?> get props => [themeData,themeMode];
}

class DarkThemeState extends ThemeState{
  final themeData = ThemeData.dark(useMaterial3: true,).copyWith(
    scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Colors.transparent),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.nothingYouCouldDo(
            fontSize: 54,
            fontWeight: FontWeight.bold,
            color: AppColors.appWhiteColor
        ),
        displayMedium: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.appPrimaryTextColorDark
        ),
        // displaySmall: ,
        // headlineLarge: ,
        // headlineMedium: ,
        // headlineSmall: ,
        // titleLarge: ,
        // titleMedium: ,
        // titleSmall: ,
        // bodyLarge: ,
        // bodyMedium: ,
        // bodySmall: ,
        // labelLarge: ,
        // labelMedium: ,
        // labelSmall: ,
      )
  );
  final themeMode = ThemeMode.dark;
  @override
  List<Object?> get props => [themeData,themeMode];
}