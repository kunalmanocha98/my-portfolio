import 'package:flutter/material.dart';
import 'package:portfolio/modules/techStack/model/tech_stack_model.dart';
class TechStackItemWidget extends StatelessWidget{
  final TechStackItem item;
  final bool isMobile;
  const TechStackItemWidget({super.key, required this.item,required this.isMobile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.network(
        item.icon!,
        height: isMobile?36:54,
        width: isMobile?36:54,
        fit: BoxFit.contain,
      ),
    );
  }
}