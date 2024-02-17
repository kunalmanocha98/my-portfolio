import 'package:flutter/material.dart';
import 'package:portfolio/modules/projects/models/project_model.dart';
import 'package:portfolio/utils/text_styles.dart';

class ProjectItemWidget extends StatelessWidget {
  final ProjectItem project;
  const ProjectItemWidget({super.key,required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(project.image!),
              fit: BoxFit.cover)),
      child: Column(
          children: [
            const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.black87),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((project.name!).toUpperCase(),style: TextStyles.projectTitleStyle),
                  ],
                ),
              ),
              const Icon(Icons.link,color: Colors.white,)
            ],
          ),
        )
      ]),
    );
  }
}
