import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';

class ExperienceItemWidget extends StatelessWidget{
  const ExperienceItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text("Senior Software Engineer at Sidan Global Solutions",
                style: TextStyles.expTitleStyle,),
              ),
              const SizedBox(width: 100,),
              Text("August 2023 - present",
              style: TextStyles.expDateStyle,)
            ],
          ),
          const SizedBox(height: 12,),
          Text("At Meta, I served as a  Software Engineer, focusing on the design and implementation of backend systems for the social media giant's dynamic platform. Working on projects that involved large-scale data processing and user engagement features, I leveraged my expertise to ensure seamless functionality and scalability.",
            style: TextStyles.expDescStyle,)
        ],
      ),
    );
  }

}