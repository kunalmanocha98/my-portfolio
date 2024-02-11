import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class ContactPage extends StatelessWidget{
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.contactContainerColorDark
      ),
    );

  }

}