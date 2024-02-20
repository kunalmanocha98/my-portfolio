import 'dart:html';

import 'package:flutter/foundation.dart';
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
}
