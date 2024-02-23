import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/projects/bloc/project_bloc.dart';
import 'package:portfolio/modules/projects/models/project_model.dart';
import 'package:portfolio/modules/projects/state/project_state.dart';
import 'package:portfolio/modules/projects/ui/project_item_widget.dart';
import 'package:portfolio/utils/strings.dart';

class ProjectsWidgetWeb extends StatelessWidget {
  const ProjectsWidgetWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (BuildContext context, ProjectState state) {
        if (state is InitialProjectState) {
          return _projectWidget(state.projectsResponse);
        } else if (state is LoadedProjectState) {
          return _projectWidget(state.projectsResponse);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _projectWidget(ProjectsResponse projectsResponse) {
    return Column(
      children: [
        ModuleTitleWidget(
            title: AppStrings.projects,
            isMobile: false,
            color: projectsResponse.color ?? "FFFFAB40"),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            scrollDirection: Axis.horizontal,
            itemCount: projectsResponse.projects?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return ProjectItemWidget(
                  project: projectsResponse.projects?[index], isMobile: false);
            },
          ),
        )
      ],
    );
  }
}
