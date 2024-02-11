import 'package:flutter/material.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/projects/project_item_widget.dart';

class ProjectsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ModuleTitleWidget(title: "Projects", color: "FFFFAB40"),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 300,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 100),
            scrollDirection: Axis.horizontal,
            children: List.generate(5, (index) => ProjectItemWidget()),
          ),
        )
      ],
    );
  }
}
