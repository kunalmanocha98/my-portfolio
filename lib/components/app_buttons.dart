import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/text_styles.dart';

class AppButtons {
  String buttonText;
  void Function() onPressed;

  AppButtons({required this.buttonText, required this.onPressed});

  Widget getFilledButton() => TextButton(

    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 32),
        shape: const StadiumBorder(
          side: BorderSide(color: AppColors.appWhiteColor, width: 2),
        ),
        backgroundColor: AppColors.appWhiteColor),
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: TextStyles.buttonStyle,
    ),
      );

  Widget getOutlinedButton() => TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 32),
            shape: const StadiumBorder(
              side: BorderSide(color: AppColors.appWhiteColor, width: 2),
            ),
            backgroundColor: AppColors.appBlackColor),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyles.buttonStyle.copyWith(
            color: AppColors.appPrimaryTextColorDark
          ),
        ),
      );
}
