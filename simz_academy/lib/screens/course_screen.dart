import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
        leading: IconButton(
          icon: const Icon(IconsaxPlusLinear.arrow_square_left),
          onPressed: () {},
        ),
        title: const Center(child: Text('Courses')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('lib/assets/images/course1.png')),
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
          ],
        ),
      ),
    );
  }
}
