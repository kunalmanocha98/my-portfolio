import 'package:flutter/material.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/components/tech_stack_item_widget.dart';

class TechStackWidget extends StatelessWidget{
  final techStackUrls = [
    "https://static-00.iconduck.com/assets.00/flutter-icon-826x1024-4ksxnd3g.png",
    "https://cdn1.iconfinder.com/data/icons/logotypes/32/android-512.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Apple_Computer_Logo_rainbow.svg/800px-Apple_Computer_Logo_rainbow.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/512px-Visual_Studio_Code_1.35_icon.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/2048px-Git_icon.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png",
    "https://static-00.iconduck.com/assets.00/node-js-icon-1901x2048-mk1e13df.png",
    "https://cdn-icons-png.flaticon.com/256/174/174854.png",
    "https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/121-css3-512.png"
  ];
  TechStackWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModuleTitleWidget(title: "Tech Stack", color: "8AFFFFFF"),
        SizedBox(height: 24,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: techStackUrls.map((url) => TechStackItemWidget(url: url)).toList(),
        ),
      ],
    );
  }

}