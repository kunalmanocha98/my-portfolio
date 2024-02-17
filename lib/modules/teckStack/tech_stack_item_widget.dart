import 'package:flutter/material.dart';
import 'package:portfolio/modules/teckStack/model/tech_stack_model.dart';
class TechStackItemWidget extends StatelessWidget{
  final TechStackItem item;
  const TechStackItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.network(
        item.icon!,
        height: 54,
        width: 54,
        fit: BoxFit.contain,
      ),
    );
  }
}