import 'package:flutter/material.dart';

typedef ResponsiveWidgetChild = Widget Function(BuildContext context ,bool isMobile);

class ResponsiveWidget extends StatefulWidget {
  final ResponsiveWidgetChild child;

  const ResponsiveWidget({super.key,required this.child});

  @override
  ResponsiveWidgetState createState() => ResponsiveWidgetState();

}
class ResponsiveWidgetState extends State<ResponsiveWidget>{

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width<600;
    return widget.child(context,isMobile);
  }

}