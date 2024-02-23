import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/personal/personal_widget.dart';
import 'package:portfolio/utils/dimens.dart';
import '../teckStack/tech_stack_widget.dart';
import '../contact/contact_page.dart';
import '../experience/experience_widget.dart';
import '../projects/projects_widget.dart';

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
                  PersonalWidget(isMobile:isMobile),
                  SizedBox(
                    height: dimens.gapLarge,
                  ),
                  TechStackWidget(isMobile:isMobile),
                  SizedBox(
                    height:  dimens.gapBig,
                  ),
                  ProjectsWidget(isMobile: isMobile,),
                  SizedBox(
                    height: dimens.gapBig,
                  ),
                  ExperienceWidget(isMobile: isMobile,),
                  SizedBox(
                    height:  dimens.gapBig,
                  ),
                  ContactWidget(isMobile: isMobile,)
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
