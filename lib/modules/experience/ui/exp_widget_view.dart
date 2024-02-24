import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';

import 'exp_widget_web.dart';
import 'experience_widget_mob.dart';

class ExpWidgetView extends StatelessWidget{
  const ExpWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(child: (BuildContext context, bool isMobile) {
      return isMobile?const ExpWidgetMob():const ExpWidgetWeb();
    },);
  }

}