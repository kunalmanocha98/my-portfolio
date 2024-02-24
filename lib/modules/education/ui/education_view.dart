import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/education/ui/education_view_mob.dart';

import 'education_view_web.dart';

class EducationView extends StatelessWidget{
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      child: (BuildContext context, bool isMobile) {
        return isMobile?const EducationViewMob():const EducationViewWeb();
      },
    );
  }

}