import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/components/responsive_widget.dart';
import 'package:portfolio/modules/education/ui/education_view.dart';
import 'package:portfolio/modules/experience/ui/exp_widget_view.dart';
import 'package:portfolio/theme/theme_bloc.dart';
import 'package:portfolio/theme/theme_state.dart';
import 'package:portfolio/utils/dimens.dart';
import '../contact/ui/contact_page_view.dart';
import '../personal/ui/personal_widget_view.dart';
import '../projects/ui/project_widget_view.dart';
import '../techStack/ui/tech_stack_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(child: (context, isMobile) {
      var themeBloc = BlocProvider.of<ThemeBloc>(context);
      var dimens = Dimensions(isMobile);
      return Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
              if (state is LightThemeState) {
                return IconButton(
                  onPressed: () {
                    themeBloc.changeState(false);
                  },
                  icon: const Icon(Icons.dark_mode),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    themeBloc.changeState(true);
                  },
                  icon: const Icon(Icons.light_mode),
                );
              }
            }),
            Padding(padding: EdgeInsets.only(right: isMobile?12:20))
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                PersonalWidgetView(),
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
            ),
          ),
        ),
      );
    });
  }
}
