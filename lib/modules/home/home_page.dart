import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/experience/ui/exp_widget_view.dart';
import 'package:portfolio/utils/dimens.dart';
import '../contact/ui/contact_page_view.dart';
import '../personal/ui/personal_widget_view.dart';
import '../projects/ui/project_widget_view.dart';
import '../techStack/ui/tech_stack_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: ResponsiveWidget(
            child: (context,isMobile) {
              var dimens = Dimensions(isMobile);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PersonalWidgetView(),
                  SizedBox(
                    height: dimens.gapLarge,
                  ),
                  const TechStackWidgetView(),
                  SizedBox(
                    height:  dimens.gapBig,
                  ),
                  const ProjectWidgetView(),
                  SizedBox(
                    height: dimens.gapBig,
                  ),
                  const ExpWidgetView(),
                  SizedBox(
                    height:  dimens.gapBig,
                  ),
                  const ContactWidgetView()
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
