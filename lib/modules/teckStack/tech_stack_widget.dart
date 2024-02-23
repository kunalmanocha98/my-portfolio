import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/module_title_widget.dart';
import 'package:portfolio/modules/teckStack/model/tech_stack_model.dart';
import 'package:portfolio/modules/teckStack/tech_stack_item_widget.dart';
import 'package:portfolio/utils/dimens.dart';
import 'package:portfolio/utils/strings.dart';
import '../../utils/firebase_keys.dart';


class TechStackWidget extends StatefulWidget {
  final bool isMobile;
  const TechStackWidget({super.key,required this.isMobile});

  @override
  TechStackWidgetState createState() => TechStackWidgetState();
}
class TechStackWidgetState extends State<TechStackWidget>{

  TechStackResponse? techStackResponse;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var dimens = Dimensions(widget.isMobile);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModuleTitleWidget(title: AppStrings.techStack, isMobile:widget.isMobile,color: techStackResponse!=null?techStackResponse!.color!:"8AFFFFFF"),
        SizedBox(height: dimens.gapMedium,),
        techStackResponse!=null?
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: techStackResponse!.list!.map((item) => TechStackItemWidget(item: item,isMobile:widget.isMobile)).toList(),
          ),
        ):const SizedBox.shrink(),
      ],
    );
  }

  void fetchData() async{
    var db = FirebaseFirestore.instance;
    var data = (await db.collection(CollectionNames.techStackCollection).doc(DocumentNames.techStack).get()).data();
    techStackResponse = TechStackResponse.fromJson(data!);
    setState(() {});
  }

}