import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/text_styles.dart';

class AppButtons {
  String buttonText;
  bool isMobile;
  void Function() onPressed;

  AppButtons({required this.buttonText, required this.onPressed,required this.isMobile});

  Widget getFilledButton() => TextButton(

    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: isMobile?16:20,horizontal: isMobile?24:32),
        shape: const StadiumBorder(
          side: BorderSide(color: AppColors.appWhiteColor, width: 2),
        ),
        backgroundColor: AppColors.appWhiteColor),
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: isMobile?TextStylesMobile.buttonStyle:TextStyles.buttonStyle,
    ),
      );

  Widget getOutlinedButton() => TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: isMobile?16:20,horizontal: isMobile?24:32),
            shape: const StadiumBorder(
              side: BorderSide(color: AppColors.appWhiteColor, width: 2),
            ),
            backgroundColor: AppColors.appBlackColor),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: (isMobile?TextStylesMobile.buttonStyle:TextStyles.buttonStyle).copyWith(
            color: AppColors.appPrimaryTextColorDark
          ),
        ),
      );
}
