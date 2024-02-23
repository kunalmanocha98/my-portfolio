import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';

import '../utils/text_styles.dart';

class ModuleTitleWidget extends StatelessWidget{
  final String title;
  final String color;
  final bool isMobile;

  const ModuleTitleWidget({super.key, required this.title,required this.color,required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: (isMobile?TextStylesMobile.moduleTitleStyle:TextStyles.moduleTitleStyle).copyWith(
        color: Color(color.toColorInt)
      ),
    );
  }

}