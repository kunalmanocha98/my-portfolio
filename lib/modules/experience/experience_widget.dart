import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/experience/experience_item_widget.dart';
import 'package:portfolio/modules/experience/models/experience_model.dart';

import '../../utils/firebase_keys.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  ExperienceWidgetState createState() => ExperienceWidgetState();
}
class ExperienceWidgetState extends State<ExperienceWidget>{
  ExperienceResponse? experienceResponse;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ModuleTitleWidget(title: "Experience", color: "FF448AFF"),
        const SizedBox(
          height: 50,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(experienceResponse?.experiences?.length ?? 0, (index) => ExperienceItemWidget(experience: experienceResponse!.experiences![index],)),
        )
      ],
    );
  }

  void fetchData() async{
    var db = FirebaseFirestore.instance;
    var data = (await db.collection(CollectionNames.experience).doc(DocumentNames.relevantExperience).get()).data();
    experienceResponse = ExperienceResponse.fromJson(data!);
    setState(() {});
  }


}
