import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/text_styles.dart';

class AppButtons {
  String buttonText;
  bool isMobile;
  void Function() onPressed;

  AppButtons(
      {required this.buttonText,
      required this.onPressed,
      required this.isMobile});

  Widget getFilledButton(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 20, horizontal: isMobile ? 24 : 32),
            shape: StadiumBorder(
              side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.appWhiteColor
                      : AppColors.appBlackColor,
                  width: 2),
            ),
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? AppColors.appWhiteColor
                : AppColors
                    .appBackGroundColorDark), // Filled button usually contrasts, but keeping original logic or adapting.
        // Original logic: backgroundColor: AppColors.appWhiteColor (regardless of theme? No, it was static white).
        // If theme is dark (black background), button is white.
        // If theme is light (white background), button should be black?
        // Let's make it adaptive.
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: isMobile
              ? TextStylesMobile.buttonStyle(context)
              : TextStyles.buttonStyle(context),
        ),
      );

  Widget getOutlinedButton(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 20, horizontal: isMobile ? 24 : 32),
            shape: StadiumBorder(
              side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.appWhiteColor
                      : AppColors.appBlackColor,
                  width: 2),
            ),
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor), // Match background
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: (isMobile
                  ? TextStylesMobile.buttonStyle(context)
                  : TextStyles.buttonStyle(context))
              .copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.appWhiteColor
                      : AppColors.appBlackColor),
        ),
      );
}
