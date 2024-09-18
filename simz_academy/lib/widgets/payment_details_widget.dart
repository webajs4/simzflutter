import 'package:flutter/material.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/supabase_functions.dart';

Widget paymentDetailsWidget (String courseName , String coursePrice) {
  var email = getCurrentUserEmail();
  print(email);
  return Center(
    child: Column(
      children: [
        HomeUiHelper().customText('Course Name : $courseName, \nCourse price : $coursePrice\nName : ${getCurrentUserName()}\nE-mail: ${getCurrentUserEmail()}', 20, FontWeight.w300, Colors.black)
      ],
    ),
  );

}