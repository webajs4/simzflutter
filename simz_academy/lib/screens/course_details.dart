// ignore_for_file: non_constant_identifier_names

//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/consumers/course_detail_consumer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetails extends StatefulWidget {
  final String course_id;
  final String course_instructor;
  final String course_title;
  const CourseDetails({
    super.key,
    required this.course_id,
    required this.course_instructor,
    required this.course_title,
  });

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    //getDetails();
    List courseDetailList = [];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                ClipPath(
                  clipper: CourseDetailsClipper(),
                  child: Container(
                    height: 400,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(181, 95, 214, 1),
                          Color.fromRGBO(132, 56, 156, 1)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.close_square,
                        color: Color.fromRGBO(251, 246, 253, 1),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        // padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        //   const EdgeInsets.all(16),
                        // ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(181, 95, 214, 1),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: Center(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage('lib/assets/images/person.png'),
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                child: Image.asset(
                                  'lib/assets/images/person.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          HomeUiHelper().customText(
                            widget.course_instructor,
                            18,
                            FontWeight.w600,
                            Color.fromRGBO(251, 246, 253, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 125,
                  left: 15,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeUiHelper().customText(
                              widget.course_title,
                              32,
                              FontWeight.w600,
                              Color.fromRGBO(251, 246, 253, 1)),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset('lib/assets/images/sheets.png'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Iconsax.note,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          Text(
                            " ${getDetails(courseDetailList)} Lessons",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  HomeUiHelper().customText(
                      'Lessons', 20, FontWeight.w600, Color(0xFF380F43)),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 1.2,
                    ),
                    child: CourseDetailConsumer(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> getDetails(List courseDetailList) async {
    // Get course details
    final response = await Supabase.instance.client
        .from('course_details')
        .select('*')
        .eq('course_id', widget.course_id);

    for (var detail in response) {
      //print("${detail['id']} ${detail['lessons']}");

      // Assuming response is a map, add the whole map to the list
      courseDetailList.add(detail);
    }
    return courseDetailList.length;
  }
}

class CourseDetailsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - size.height / 4);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
