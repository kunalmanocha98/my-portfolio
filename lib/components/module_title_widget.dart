import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';

import '../utils/text_styles.dart';

class ModuleTitleWidget extends StatelessWidget{
  final String title;
  final String color;

  const ModuleTitleWidget({super.key, required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyles.moduleTitleStyle.copyWith(
        color: Color(color.toColorInt)
      ),
    );
  }
}