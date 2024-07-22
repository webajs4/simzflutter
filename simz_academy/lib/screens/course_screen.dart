import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/course_ui_helper.dart';
import 'package:simz_academy/widgets/common_widgets.dart';
import 'package:simz_academy/widgets/course_screen_widgets.dart';

String imagepath = "lib/assets/images/course2.png";

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(236, 215, 247, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.notification,
                      color: Color.fromRGBO(56, 15, 67, 1.0),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
        title: CourseUiHelper().customText(
            'Courses', 24, FontWeight.w600, Color.fromRGBO(56, 15, 67, 1)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('lib/assets/images/course1.png')),
            const SizedBox(
              height: 10,
            ),
            CourseCard(
                imageUrl: imagepath,
                title: 'Course Title',
                subtitle: 'Course Description',
                review: 4.5,
                fees: 100),
            CourseCard(
                imageUrl: imagepath,
                title: 'Course Title',
                subtitle: 'Course Description',
                review: 4.5,
                fees: 100),
            CourseCard(
                imageUrl: imagepath,
                title: 'Course Title',
                subtitle: 'Course Description',
                review: 4.5,
                fees: 100),
            CourseCard(
                imageUrl: imagepath,
                title: 'Course Title',
                subtitle: 'Course Description',
                review: 4.5,
                fees: 100),
            FooterWidget()
          ],
        ),
      ),
    );
  }
}
