import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/modules/getInTouch/getInTouchView.dart';
import 'package:portfolio/modules/personal/model/personal_detail_model.dart';
import 'package:portfolio/utils/strings.dart';
import '../../components/app_buttons.dart';
import '../../utils/app_logic.dart';
import '../../utils/firebase_keys.dart';
import '../../utils/text_styles.dart';

class PersonalWidget extends StatefulWidget {
  final bool isMobile;
  const PersonalWidget({super.key,required this.isMobile});

  @override
  PersonalWidgetState createState() => PersonalWidgetState();
}

class PersonalWidgetState extends State<PersonalWidget> {
  PersonalDetailsResponse? personal;
  // String image = "https://cdn3d.iconscout.com/3d/premium/thumb/web-developer-4506461-3738664.png";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: widget.isMobile?24:32.0),
            child: Text(
              personal?.name ?? "-",
              style: widget.isMobile?TextStylesMobile.nameStyle:TextStyles.nameStyle,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: widget.isMobile?28:36.0),
            child:
            CircleAvatar(
              radius: widget.isMobile?54:100,
              backgroundImage: const AssetImage("assets/images/profile_image1.jpg"),
            )
          ),
           SizedBox(
            height: widget.isMobile?24:36,
          ),
          SizedBox(
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: widget.isMobile?TextStylesMobile.headingStyle:TextStyles.headingStyle, children: [
                const TextSpan(
                  text: AppStrings.subtitle1,
                ),
                const TextSpan(
                  text: AppStrings.subtitle2,
                ),
                TextSpan(
                    text: AppStrings.subtitle3,
                    style: (widget.isMobile?TextStylesMobile.headingStyle:TextStyles.headingStyle)
                        .copyWith(color: Colors.limeAccent))
              ]),
            ),
          ),
          Container(
            width: widget.isMobile?null:500,
            margin: EdgeInsets.symmetric(vertical: 16,horizontal: widget.isMobile?16:0),
            child: Text(
              personal?.description ?? "-",
              textAlign: TextAlign.center,
              style: widget.isMobile?TextStylesMobile.descriptionStyle:TextStyles.descriptionStyle,
            ),
          ),
          SizedBox(
            height: widget.isMobile?16:24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButtons(
                buttonText: AppStrings.getInTouch,
                isMobile: widget.isMobile,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return GetInTouchView(isMobile: widget.isMobile,);
                    },
                  ).then((value) {
                    if (value!=null && value) {
                      AppLogic.showSnackBar(
                          context, AppStrings.submittedSuccessfully);
                    }
                  });
                },
              ).getFilledButton(),
              const SizedBox(
                width: 20,
              ),
              AppButtons(
                buttonText: AppStrings.downloadCV,
                isMobile: widget.isMobile,
                onPressed: () {
                  AppLogic.viewCVPdf(
                      personal?.cv?.cvPath ?? "", personal?.cv?.cvName ?? "");
                },
              ).getOutlinedButton()
            ],
          ),
        ],
      );
  }

  void fetchData() async {
    var db = FirebaseFirestore.instance;
    var data = (await db
            .collection(CollectionNames.profileCollection)
            .doc(DocumentNames.personal)
            .get())
        .data();
    personal = PersonalDetailsResponse.fromJson(data!);
    setState(() {});
  }
}
