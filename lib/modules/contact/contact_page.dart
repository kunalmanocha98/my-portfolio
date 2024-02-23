import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/modules/contact/model/contact_model.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_logic.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/utils/text_styles.dart';
import '../../utils/firebase_keys.dart';


class ContactWidget extends StatefulWidget {
  final bool isMobile;
  const ContactWidget({super.key,required this.isMobile});

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
          width: widget.isMobile?null:600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.contact,
                style: widget.isMobile?TextStylesMobile.expTitleStyle:TextStyles.expTitleStyle,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: widget.isMobile?24:32.0),
                child: Text(
                  contactResponse?.summary ?? "",
                  style: widget.isMobile?TextStylesMobile.expDescStyle:TextStyles.expDescStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: widget.isMobile?14:20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: AppColors.appWhiteColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:widget.isMobile?8:12.0),
                      child: SelectableText(
                        contactResponse?.email ?? "",
                        style: widget.isMobile?TextStylesMobile.expDescStyle:TextStyles.expDescStyle,
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
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 8.0, right: 8,top:12),
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
