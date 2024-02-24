import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/education/bloc/education_bloc.dart';
import 'package:portfolio/modules/education/model/education_model.dart';
import 'package:portfolio/utils/strings.dart';

import '../state/education_state.dart';
import 'education_item_widget.dart';

class EducationViewMob extends StatelessWidget {
  const EducationViewMob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationBloc, EducationState>(
      builder: (BuildContext context, EducationState state) {
        if (state is InitialEducationState) {
          return _expWidget(state.educationalResponse);
        } else if (state is LoadedEducationState) {
          return _expWidget(state.educationalResponse);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _expWidget(EducationalResponse experienceResponse) {
    return Column(
      children: [
        ModuleTitleWidget(
            title: AppStrings.educationDetails,
            isMobile: true,
            color: experienceResponse.color ?? "FFFF5154"),
        const SizedBox(
          height: 36,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              experienceResponse.educationalDetails?.length ?? 0,
                  (index) => EducationItemWidget(
                  education: experienceResponse.educationalDetails![index],
                  isMobile: true)),
        )
      ],
    );
  }
}
