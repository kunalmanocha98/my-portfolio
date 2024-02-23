import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/techStack/bloc/tech_bloc.dart';
import 'package:portfolio/modules/techStack/state/tech_state.dart';
import 'package:portfolio/modules/techStack/ui/tech_stack_item_widget.dart';

import '../../../components/module_title_widget.dart';
import '../../../utils/strings.dart';
import '../model/tech_stack_model.dart';

class TechStackWidgetWeb extends StatelessWidget {
  const TechStackWidgetWeb({super.key});

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
            isMobile: false,
            color:techStackResponse.color??"8AFFFFFF"),
        const SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: (techStackResponse.list??[])
                .map((item) => TechStackItemWidget(
                item: item, isMobile: false))
                .toList(),
          ),
        ),
      ],
    );
  }
}
