import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/techStack/ui/tech_stack_widget_mob.dart';
import 'package:portfolio/modules/techStack/ui/tech_stack_widget_web.dart';

class TechStackWidgetView extends StatelessWidget {
  const TechStackWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      child: (BuildContext context, bool isMobile) {
        return isMobile ? const TechStackWidgetMob() : const TechStackWidgetWeb();
      },
    );
  }
}
