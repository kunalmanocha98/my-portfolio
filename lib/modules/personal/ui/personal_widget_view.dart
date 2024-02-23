import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/personal/ui/personal_widget_mob.dart';
import 'package:portfolio/modules/personal/ui/personal_widget_web.dart';

class PersonalWidgetView extends StatelessWidget {
  const PersonalWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      child: (BuildContext context, bool isMobile) {
        return isMobile ? const PersonalWidgetMob() : const PersonalWidgetWeb();
      },
    );
  }
}
