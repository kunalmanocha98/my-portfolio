import 'package:flutter/material.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/experience/experience_item_widget.dart';

class ExperienceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ModuleTitleWidget(title: "Experience", color: "FF448AFF"),
        SizedBox(
          height: 50,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) => ExperienceItemWidget()),
        )
      ],
    );
  }
}
