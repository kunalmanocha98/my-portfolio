import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/app_buttons.dart';
import 'package:portfolio/components/tech_stack_widget.dart';
import 'package:portfolio/modules/projects/projects_widget.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/utils/text_styles.dart';

import '../experience/experience_widget.dart';

class TestPage extends StatelessWidget{
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top:36.0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage("https://cdn3d.iconscout.com/3d/premium/thumb/web-developer-4506461-3738664.png"),
                ),
              ),
              const SizedBox(height: 36,),
              Container(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyles.headingStyle,
                    children: [
                      const TextSpan(
                        text: "I do code and\n",
                      ),
                      const TextSpan(
                        text: "make beautiful ",
                      ),
                      TextSpan(
                        text: "Apps!",
                        style: TextStyles.headingStyle.copyWith(
                          color: Colors.limeAccent
                        )
                      )
                    ]
                  ),
                ),
              ),
              Container(
                width: 500,
                margin: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                  AppStrings.descriptionString,
                  textAlign: TextAlign.center,
                  style: TextStyles.descriptionStyle,

                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButtons(buttonText: "Get in touch", onPressed: (){}).getFilledButton(),
                  const SizedBox(width: 20,),
                  AppButtons(buttonText: "Download CV", onPressed: (){}).getOutlinedButton()
                ],
              ),
              const SizedBox(height: 100,),
              TechStackWidget(),
              const SizedBox(height: 100,),
              ProjectsWidget(),
              const SizedBox(height: 50,),
              ExperienceWidget()
            ],
          ),
        ),
      ),
    );
  }

}