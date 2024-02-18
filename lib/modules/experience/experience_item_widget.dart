import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'models/experience_model.dart';

class ExperienceItemWidget extends StatelessWidget{
  final ExperienceItem experience;
  const ExperienceItemWidget({super.key,required this.experience});

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
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${experience.designation}",style: TextStyles.expTitleStyle),
                    Text("${experience.name}, ${experience.location}",
                    style: TextStyles.expTitleStyle.copyWith(
                      fontSize: 14,
                      color: Colors.white70
                    ),),
                  ],
                ),
              ),
              const SizedBox(width: 100,),
              Text("${experience.fromDate} - ${experience.toDate}",
              style: TextStyles.expDateStyle,)
            ],
          ),
          const SizedBox(height: 12,),
          Text("${experience.summary}",
            style: TextStyles.expDescStyle,)
        ],
      ),
    );
  }

}