import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/projects/models/project_model.dart';
import 'package:portfolio/modules/projects/project_item_widget.dart';
import 'package:portfolio/utils/strings.dart';

import '../../utils/firebase_keys.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  ProjectsWidgetState createState() => ProjectsWidgetState();
}
class ProjectsWidgetState extends State<ProjectsWidget>{
  ProjectsResponse? projectsResponse;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ModuleTitleWidget(title: AppStrings.projects, color: projectsResponse?.color??"FFFFAB40"),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            scrollDirection: Axis.horizontal,
            itemCount: projectsResponse?.projects?.length??0,
            itemBuilder: (BuildContext context, int index) {
              return ProjectItemWidget(project:projectsResponse?.projects?[index]);
            },
          ),
        )
      ],
    );
  }

  void fetchData() async{
    var db = FirebaseFirestore.instance;
    var data = (await db.collection(CollectionNames.projectsCollection).doc(DocumentNames.companyProjects).get()).data();
    projectsResponse = ProjectsResponse.fromJson(data!);
    setState(() {});
  }
}
