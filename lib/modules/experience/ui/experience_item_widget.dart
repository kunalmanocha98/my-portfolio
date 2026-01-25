import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';
import '../models/experience_model.dart';

class ExperienceItemWidget extends StatelessWidget {
  final ExperienceItem experience;
  final bool isMobile;
  const ExperienceItemWidget(
      {super.key, required this.experience, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? null : 600,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: isMobile ? 20 : 0),
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
                    Text("${experience.designation}",
                        style: isMobile
                            ? TextStylesMobile.expTitleStyle(context)
                            : TextStyles.expTitleStyle(context)),
                    Text(
                      "${experience.name}, ${experience.location}",
                      style: (isMobile
                              ? TextStylesMobile.expTitleStyle(context)
                              : TextStyles.expTitleStyle(context))
                          .copyWith(
                              fontSize: isMobile ? 10 : 14,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white70
                                  : Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              Text(
                "${experience.fromDate} - ${experience.toDate}",
                style: isMobile
                    ? TextStylesMobile.expDateStyle(context)
                    : TextStyles.expDateStyle(context),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "${experience.summary}",
            style: isMobile
                ? TextStylesMobile.expDescStyle(context)
                : TextStyles.expDescStyle(context),
          )
        ],
      ),
    );
  }
}
