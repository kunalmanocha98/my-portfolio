import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/personal/bloc/personal_bloc.dart';
import 'package:portfolio/modules/personal/state/personal_state.dart';

import '../../../components/app_buttons.dart';
import '../../../utils/app_logic.dart';
import '../../../utils/strings.dart';
import '../../../utils/text_styles.dart';
import '../../getInTouch/get_in_touch_view.dart';
import '../model/personal_detail_model.dart';

class PersonalWidgetWeb extends StatelessWidget {
  const PersonalWidgetWeb({
    super.key,
  });

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
          padding: const EdgeInsets.only(top: 32.0),
          child: Text(
            personalData.name ?? "-",
            style: TextStyles.nameStyle(context),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 36.0),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/profile_image_2.jpg"),
            )),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: TextStyles.headingStyle(context), children: [
              const TextSpan(
                text: AppStrings.subtitle1,
              ),
              const TextSpan(
                text: AppStrings.subtitle2,
              ),
              TextSpan(
                  text: AppStrings.subtitle3,
                  style: (TextStyles.headingStyle(context))
                      .copyWith(color: Colors.limeAccent))
            ]),
          ),
        ),
        Container(
          width: 500,
          margin: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Text(
            personalData.description ?? "-",
            textAlign: TextAlign.center,
            style: TextStyles.descriptionStyle(context),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButtons(
              buttonText: AppStrings.getInTouch,
              isMobile: false,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const GetInTouchView(
                      isMobile: false,
                    );
                  },
                ).then((value) {
                  if (value != null && value && context.mounted) {
                    AppLogic.showSnackBar(
                        context, AppStrings.submittedSuccessfully);
                  }
                });
              },
            ).getFilledButton(context),
            const SizedBox(
              width: 20,
            ),
            AppButtons(
              buttonText: AppStrings.downloadCV,
              isMobile: false,
              onPressed: () {
                AppLogic.viewCVPdf(personalData.cv?.cvPath ?? "",
                    personalData.cv?.cvName ?? "");
              },
            ).getOutlinedButton(context)
          ],
        ),
      ],
    );
  }
}
