import 'package:flutter/material.dart';
import 'package:portfolio/modules/personal/personal_widget.dart';
import '../teckStack/tech_stack_widget.dart';
import '../contact/contact_page.dart';
import '../experience/experience_widget.dart';
import '../projects/projects_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PersonalWidget(),
              SizedBox(
                height: 100,
              ),
              TechStackWidget(),
              SizedBox(
                height: 100,
              ),
              ProjectsWidget(),
              SizedBox(
                height: 50,
              ),
              ExperienceWidget(),
              SizedBox(
                height: 50,
              ),
              ContactWidget()
            ],
          ),
        ),
      ),
    );
  }
}
