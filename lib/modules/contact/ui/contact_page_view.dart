import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/contact/ui/contact_page_mob.dart';
import 'package:portfolio/modules/contact/ui/contact_page_web.dart';

class ContactWidgetView extends StatelessWidget{
  const ContactWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(child: (BuildContext context, bool isMobile) {
      return isMobile?const ContactWidgetMob():const ContactWidgetWeb();
    },);
  }

}