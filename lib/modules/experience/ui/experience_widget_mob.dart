import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/experience/bloc/exp_bloc.dart';
import 'package:portfolio/modules/experience/state/exp_state.dart';
import 'package:portfolio/modules/experience/ui/experience_item_widget.dart';
import 'package:portfolio/modules/experience/models/experience_model.dart';
import 'package:portfolio/utils/strings.dart';

class ExpWidgetMob extends StatelessWidget {
  const ExpWidgetMob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpBloc, ExpState>(
      builder: (BuildContext context, ExpState state) {
        if (state is InitialExpState) {
          return _expWidget(state.experienceResponse);
        } else if (state is LoadedExpState) {
          return _expWidget(state.experienceResponse);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _expWidget(ExperienceResponse experienceResponse) {
    return Column(
      children: [
        ModuleTitleWidget(
            title: AppStrings.experience,
            isMobile: true,
            color: experienceResponse.color ?? "FF448AFF"),
        const SizedBox(
          height: 36,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              experienceResponse.experiences?.length ?? 0,
              (index) => ExperienceItemWidget(
                  experience: experienceResponse.experiences![index],
                  isMobile: true)),
        )
      ],
    );
  }
}
