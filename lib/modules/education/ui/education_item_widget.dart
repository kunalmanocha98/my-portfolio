import 'package:flutter/material.dart';
import 'package:portfolio/modules/education/model/education_model.dart';
import 'package:portfolio/utils/text_styles.dart';

class EducationItemWidget extends StatelessWidget {
  final EducationalDetails education;
  final bool isMobile;
  const EducationItemWidget(
      {super.key, required this.education, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? null : 600,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: isMobile ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${education.name}",
                        style: isMobile
                            ? TextStylesMobile.expTitleStyle(context)
                            : TextStyles.expTitleStyle(context)),
                    Text(
                      "${education.institution}, ${education.location}",
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
                "${education.fromDate} - ${education.toDate}",
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
            "${education.summary}",
            style: isMobile
                ? TextStylesMobile.expDescStyle(context)
                : TextStyles.expDescStyle(context),
          )
        ],
      ),
    );
  }
}
