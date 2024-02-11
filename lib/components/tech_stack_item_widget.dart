import 'package:flutter/material.dart';
class TechStackItemWidget extends StatelessWidget{
  final String url;
  const TechStackItemWidget({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.network(
        url,
        height: 54,
        width: 54,
        fit: BoxFit.contain,
      ),
    );
  }
}