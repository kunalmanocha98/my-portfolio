import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/teckStack/bloc/tech_bloc.dart';
import 'package:portfolio/modules/teckStack/state/tech_state.dart';
import 'package:portfolio/modules/teckStack/ui/tech_stack_item_widget.dart';

import '../../../components/module_title_widget.dart';
import '../../../utils/strings.dart';
import '../model/tech_stack_model.dart';

class TechStackWidgetMob extends StatelessWidget {
  const TechStackWidgetMob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechBloc, TechState>(
      builder: (BuildContext context, TechState state) {
        if (state is InitialTechState) {
          return _techStackWidget(context, state.techStackResponse);
        } else if (state is LoadedTechState) {
          return _techStackWidget(context, state.techStackResponse);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _techStackWidget(
      BuildContext context, TechStackResponse techStackResponse) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModuleTitleWidget(
            title: AppStrings.techStack,
            isMobile: true,
            color:techStackResponse.color??"8AFFFFFF"),
        const SizedBox(
          height: 36,
        ),
        SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: (techStackResponse.list??[])
                      .map((item) => TechStackItemWidget(
                          item: item, isMobile: true))
                      .toList(),
                ),
              ),
      ],
    );
  }
}
