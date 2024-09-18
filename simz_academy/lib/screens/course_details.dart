// ignore_for_file: non_constant_identifier_names

//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/consumers/course_detail_consumer.dart';

import '../widgets/course_screen_widgets.dart';

class CourseDetails extends StatefulWidget {
  final String course_id;
  final String course_instructor;
  final String course_title;
  final int lesson_count;
  final String course_duration;
  final String coursePrice;
  const CourseDetails({
    super.key,
    required this.course_id,
    required this.course_instructor,
    required this.course_title,
    required this.lesson_count,
    required this.course_duration, required this.coursePrice,
  });

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    //var lessonCount = getDetails();
    //getDetails();
    //List courseDetailList = [];
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: HomeUiHelper().customText(
                                widget.course_title,
                                32,
                                FontWeight.w600,
                                Color.fromRGBO(251, 246, 253, 1)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset('lib/assets/images/sheets.png'),
                        ],
                      ),
                      SizedBox.fromSize(
                        size: const Size(0, 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              Icon(
                                Iconsax.note,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              Text(
                                " ${widget.lesson_count.toString()} lessons",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Iconsax.timer_start,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              Text(
                                "${widget.course_duration} mins",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ],
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
              child: SizedBox(
                height: (MediaQuery.of(context).size.height) * .7,
                child: Center(child: CourseDetailConsumer()),
              ),
            ),
            CourseDescription(
              courseId: widget.course_id,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child : SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  HomeUiHelper().customText('Total Price', 15, FontWeight.w300, Color(0xFF380F43),),
                  HomeUiHelper().customText('₹${widget.coursePrice}', 20, FontWeight.w600, Color(0xFF380F43),),
                ],
              ),
              BuyNow(
                courseName: widget.course_title.toString(),
                coursePrice: widget.coursePrice.toString(),
              )
            ],
          ),
        )
      ),
    );
  }

// getDetails() async {
//   // Get course details
//   final response = await Supabase.instance.client
//       .from('all_courses')
//       .select('no_of_lessons')
//       .eq('course_id', widget.course_id)
//       .single();
//   var data = response;
//   debugPrint('total lessons : ${data['no_of_lessons']}');
//
//   return data['no_of_lessons'] ?? 0;
// }
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