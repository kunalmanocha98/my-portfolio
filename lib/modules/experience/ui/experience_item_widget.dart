import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';
import '../models/experience_model.dart';

class ExperienceItemWidget extends StatelessWidget{
  final ExperienceItem experience;
  final bool isMobile;
  const ExperienceItemWidget({super.key,required this.experience,required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile?null:600,
      margin: EdgeInsets.symmetric(vertical: 16,horizontal:isMobile?20:0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${experience.designation}",style: isMobile?TextStylesMobile.expTitleStyle:TextStyles.expTitleStyle),
                    Text("${experience.name}, ${experience.location}",
                    style: (isMobile?TextStylesMobile.expTitleStyle:TextStyles.expTitleStyle).copyWith(
                      fontSize: isMobile?10:14,
                      color: Colors.white70
                    ),),
                  ],
                ),
              ),
              const SizedBox(width: 100,),
              Text("${experience.fromDate} - ${experience.toDate}",
              style: isMobile?TextStylesMobile.expDateStyle:TextStyles.expDateStyle,)
            ],
          ),
          const SizedBox(height: 12,),
          Text("${experience.summary}",
            style: isMobile?TextStylesMobile.expDescStyle:TextStyles.expDescStyle,)
        ],
      ),
    );
  }

}