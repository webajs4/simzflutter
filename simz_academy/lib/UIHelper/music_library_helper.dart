import 'package:flutter/material.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';

void showAlert(BuildContext context, String url){
  String finalUrl = 'https://www.youtube.com/watch?v=$url';
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      content: HomeUiHelper().customText('Open with', 26, FontWeight.w600, Color(0xFF380F43)),
      actions: [

        //In app
        TextButton(
          onPressed: () {
            _launchURL(Uri.parse(finalUrl), true);
          },
          child: HomeUiHelper().customText('In-App', 18, FontWeight.w400, Color(0xFF380F43)),
        ),

        //External App
        TextButton(
          onPressed: () {
            _launchURL(Uri.parse(finalUrl), false);
          },
          child: HomeUiHelper().customText('External App', 18, FontWeight.w400, Color(0xFF380F43)),
        ),
      ],
    );
  });
}



void _launchURL(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(
            uri,
            mode: LaunchMode.inAppWebView,
          );
        } else {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }