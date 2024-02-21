import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/getInTouch/getInTouchView.dart';
import 'package:portfolio/modules/personal/model/personal_detail_model.dart';
import 'package:portfolio/utils/strings.dart';

import '../../components/app_buttons.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_logic.dart';
import '../../utils/firebase_keys.dart';
import '../../utils/text_styles.dart';

class PersonalWidget extends StatefulWidget {
  const PersonalWidget({super.key});

  @override
  PersonalWidgetState createState() => PersonalWidgetState();
}

class PersonalWidgetState extends State<PersonalWidget> {
  PersonalDetailsResponse? personal;

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
          padding: const EdgeInsets.only(top: 32.0),
          child: Text(
            personal?.name ?? "-",
            style: GoogleFonts.nothingYouCouldDo(
                fontSize: 54, color: AppColors.appWhiteColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(personal?.icon ??
                "https://cdn3d.iconscout.com/3d/premium/thumb/web-developer-4506461-3738664.png"),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: TextStyles.headingStyle, children: [
              const TextSpan(
                text: AppStrings.subtitle1,
              ),
              const TextSpan(
                text: AppStrings.subtitle2,
              ),
              TextSpan(
                  text: AppStrings.subtitle3,
                  style: TextStyles.headingStyle
                      .copyWith(color: Colors.limeAccent))
            ]),
          ),
        ),
        Container(
          width: 500,
          margin: const EdgeInsets.only(top: 16, bottom: 16),
          child: Text(
            personal?.description ?? "-",
            textAlign: TextAlign.center,
            style: TextStyles.descriptionStyle,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButtons(
              buttonText: AppStrings.getInTouch,
              onPressed: () {
                showDialog(context: context, builder: (BuildContext context) {
                  return const GetInTouchView();
                },).then((value) {
                  if(true){
                    AppLogic.showSnackBar(context, AppStrings.submittedSuccessfully);
                  }
                });
              },
            ).getFilledButton(),
            const SizedBox(
              width: 20,
            ),
            AppButtons(
              buttonText: AppStrings.downloadCV,
              onPressed: () {
                AppLogic.viewCVPdf(personal?.cv?.cvPath??"",personal?.cv?.cvName??"");
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
