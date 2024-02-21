import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/firebase_keys.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLogic {
  static openUrl(String url, String name) async {
    if (kIsWeb) {
      window.open(url, name);
    } else {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
    }
  }

  static void viewCVPdf(String path, String name) async {
    var data = await FirebaseStorage.instance
        .ref(FirebaseStorageKeys.cv)
        .child(path)
        .getDownloadURL();
    if (kIsWeb) {
      launchUrl(Uri.parse(data), webOnlyWindowName: name);
    } else {}
  }

  static void showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(
      margin: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
     showCloseIcon: true,closeIconColor: AppColors.appWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      content: ListTile(
        leading: const Icon(Icons.check_circle,color: Colors.green,),
        title: Text(
          message,
          style: TextStyles.expDescStyle,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
