import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/getInTouch/getInTouchView.dart';
import 'package:portfolio/modules/personal/bloc/personal_bloc.dart';
import 'package:portfolio/modules/personal/model/personal_detail_model.dart';
import 'package:portfolio/modules/personal/state/personal_state.dart';
import 'package:portfolio/utils/strings.dart';
import '../../../components/app_buttons.dart';
import '../../../utils/app_logic.dart';
import '../../../utils/text_styles.dart';

class PersonalWidgetMob extends StatelessWidget {
  const PersonalWidgetMob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalBloc, PersonalState>(builder: (context, state) {
      if (state is InitialPersonalState) {
        return _personalWidget(context, state.personalDetailsResponse);
      } else if (state is LoadedPersonalState) {
        return _personalWidget(context, state.personalDetailsResponse);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }

  Widget _personalWidget(
      BuildContext context, PersonalDetailsResponse personalData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            personalData.name ?? "-",
            style: TextStylesMobile.nameStyle,
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 28),
            child: CircleAvatar(
              radius: 54,
              backgroundImage: AssetImage("assets/images/profile_image1.jpg"),
            )),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: TextStylesMobile.headingStyle, children: [
              const TextSpan(
                text: AppStrings.subtitle1,
              ),
              const TextSpan(
                text: AppStrings.subtitle2,
              ),
              TextSpan(
                  text: AppStrings.subtitle3,
                  style: (TextStylesMobile.headingStyle)
                      .copyWith(color: Colors.limeAccent))
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Text(
            personalData.description ?? "-",
            textAlign: TextAlign.center,
            style: TextStylesMobile.descriptionStyle,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButtons(
              buttonText: AppStrings.getInTouch,
              isMobile: true,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const GetInTouchView(
                      isMobile: true,
                    );
                  },
                ).then((value) {
                  if (value != null && value) {
                    AppLogic.showSnackBar(
                        context, AppStrings.submittedSuccessfully);
                  }
                });
              },
            ).getFilledButton(),
            const SizedBox(
              width: 20,
            ),
            AppButtons(
              buttonText: AppStrings.downloadCV,
              isMobile: true,
              onPressed: () {
                AppLogic.viewCVPdf(personalData.cv?.cvPath ?? "",
                    personalData.cv?.cvName ?? "");
              },
            ).getOutlinedButton()
          ],
        ),
      ],
    );
  }
}
