import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/modules/contact/model/contact_model.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_logic.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/utils/text_styles.dart';
import '../../utils/firebase_keys.dart';


class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  ContactWidgetState createState() => ContactWidgetState();
}

class ContactWidgetState extends State<ContactWidget> {
  ContactResponse? contactResponse;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(color: AppColors.contactContainerColorDark),
      child: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.contact,
                style: TextStyles.expTitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  contactResponse?.summary ?? "",
                  style: TextStyles.expDescStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: AppColors.appWhiteColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SelectableText(
                        contactResponse?.email ?? "",
                        style: TextStyles.expDescStyle,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  (contactResponse?.socialLinks ?? []).length,
                  (index) => InkWell(
                    onTap: (){
                      AppLogic.openUrl(contactResponse?.socialLinks?[index].socialLinkUrl??"","new_window$index");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: index == 0 ? 0 : 8.0, right: 8),
                      child: Image.network(
                        contactResponse!.socialLinks![index].icon!,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchData() async {
    var db = FirebaseFirestore.instance;
    var data = (await db
            .collection(CollectionNames.profileCollection)
            .doc(DocumentNames.contact)
            .get())
        .data();
    contactResponse = ContactResponse.fromJson(data!);
    setState(() {});
  }
}
