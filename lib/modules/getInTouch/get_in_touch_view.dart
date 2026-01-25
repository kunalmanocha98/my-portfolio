import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/modules/getInTouch/model/query_model.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/firebase_keys.dart';
import 'package:portfolio/utils/text_styles.dart';

import '../../components/app_buttons.dart';
import '../../utils/form_mixins.dart';
import '../../utils/strings.dart';

class GetInTouchView extends StatefulWidget {
  final bool isMobile;
  const GetInTouchView({super.key, required this.isMobile});

  @override
  State<StatefulWidget> createState() => GetInTouchViewState();
}

class GetInTouchViewState extends State<GetInTouchView> with FormMixins {
  GlobalKey<FormState> formStateKey = GlobalKey();
  String? name;
  String? email;
  String? mobile;
  String? purpose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.appWhiteColor
                  : AppColors.appBlackColor)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Form(
        key: formStateKey,
        child: SizedBox(
          width:
              widget.isMobile ? null : MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: EdgeInsets.all(widget.isMobile ? 12 : 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
                Text(
                  AppStrings.getInTouch,
                  style:
                      TextStyles.expTitleStyle(context).copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
                TextFormField(
                  validator: validateTextField,
                  onSaved: (value) {
                    name = value;
                  },
                  style: widget.isMobile
                      ? TextStylesMobile.descriptionStyle(context)
                      : TextStyles.descriptionStyle(context),
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    labelText: "Enter your name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.appWhiteColor
                                    : AppColors.appBlackColor)),
                    hintStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                    labelStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                  ),
                ),
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
                TextFormField(
                  validator: validateEmailTextField,
                  onSaved: (value) {
                    email = value;
                  },
                  style: widget.isMobile
                      ? TextStylesMobile.descriptionStyle(context)
                      : TextStyles.descriptionStyle(context),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.appWhiteColor
                                    : AppColors.appBlackColor)),
                    hintStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                    labelStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                    hintText: "Enter your email",
                    labelText: "Enter your email",
                  ),
                ),
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    mobile = value;
                  },
                  style: widget.isMobile
                      ? TextStylesMobile.descriptionStyle(context)
                      : TextStyles.descriptionStyle(context),
                  validator: validateMobileTextField,
                  decoration: InputDecoration(
                    hintText: "Enter your mobile number",
                    labelText: "Enter your mobile number",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.appWhiteColor
                                    : AppColors.appBlackColor)),
                    hintStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                    labelStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                  ),
                ),
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
                TextFormField(
                  minLines: 8,
                  maxLines: 14,
                  textAlignVertical: TextAlignVertical.top,
                  validator: validateTextField,
                  onSaved: (value) {
                    purpose = value;
                  },
                  style: widget.isMobile
                      ? TextStylesMobile.descriptionStyle(context)
                      : TextStyles.descriptionStyle(context),
                  decoration: InputDecoration(
                    hintText: "Enter your purpose of contacting",
                    labelText: "Enter your purpose of contacting",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.appWhiteColor
                                    : AppColors.appBlackColor)),
                    hintStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                    labelStyle: widget.isMobile
                        ? TextStylesMobile.descriptionStyle(context)
                        : TextStyles.descriptionStyle(context),
                  ),
                ),
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
                AppButtons(
                  buttonText: AppStrings.submit,
                  isMobile: widget.isMobile,
                  onPressed: submitFunc,
                ).getFilledButton(context),
                SizedBox(
                  height: widget.isMobile ? 14 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitFunc() {
    if (formStateKey.currentState!.validate()) {
      formStateKey.currentState!.save();
      var docName =
          "${name!.replaceAll(" ", "").toLowerCase()}_${DateTime.now().microsecondsSinceEpoch}";
      var query =
          QueryModel(name: name, email: email, mobile: mobile, purpose: purpose)
              .toJson();
      FirebaseFirestore.instance
          .collection(CollectionNames.queries)
          .doc(docName)
          .set(query);
      Navigator.pop(context, true);
    }
  }
}
