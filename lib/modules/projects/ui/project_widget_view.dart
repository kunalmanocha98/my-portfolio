import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/projects/ui/project_widget_web.dart';
import 'package:portfolio/modules/projects/ui/projects_widget_mob.dart';

class ProjectWidgetView extends StatelessWidget{
  const ProjectWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(child: (BuildContext context, bool isMobile) {
      return isMobile?const ProjectsWidgetMob():const ProjectsWidgetWeb();
    },);
  }

}