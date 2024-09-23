import 'package:flutter/material.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/supabase_functions.dart';

Widget paymentDetailsWidget (String courseName , String coursePrice) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeUiHelper().customText('Course Name : $courseName, \nCourse price : $coursePrice\nName : ${getCurrentUserName()}\n', 20, FontWeight.w300, Colors.black),
        HomeUiHelper().customText('Email : ${getCurrentUserEmail()}', 20, FontWeight.w300, Colors.black)
      ],
    ),
  );

}