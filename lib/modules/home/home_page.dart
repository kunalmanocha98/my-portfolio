import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/education/ui/education_view.dart';
import 'package:portfolio/modules/experience/ui/exp_widget_view.dart';
import 'package:portfolio/modules/home/bloc/home_bloc.dart';
import 'package:portfolio/modules/home/state/home_state.dart';
import 'package:portfolio/utils/dimens.dart';
import 'package:portfolio/utils/strings.dart';
import '../contact/ui/contact_page_view.dart';
import '../personal/ui/personal_widget_view.dart';
import '../projects/ui/project_widget_view.dart';
import '../techStack/ui/tech_stack_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: ResponsiveWidget(child: (context, isMobile) {
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
                        height: dimens.gapBig,
                      ),
                      const ProjectWidgetView(),
                      SizedBox(
                        height: dimens.gapBig,
                      ),
                      const ExpWidgetView(),
                      SizedBox(
                        height: dimens.gapBig,
                      ),
                      const EducationView(),
                      SizedBox(
                        height: dimens.gapBig,
                      ),
                      const ContactWidgetView()
                    ],
                  );
                }),
              ),
            ),
            Visibility(
              visible: state is LoadingHomeState,
              child: Container(
                color: Colors.black,
                child: Center(
                  child: SizedBox(
                    child: TextLiquidFill(
                      text: AppStrings.appName,
                      loadDuration: const Duration(seconds: 2),
                      waveColor: Colors.blueAccent,
                      boxBackgroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
