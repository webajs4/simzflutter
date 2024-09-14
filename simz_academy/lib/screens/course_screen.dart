import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
//import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/course_ui_helper.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/widgets/common_widgets.dart';
import 'package:simz_academy/widgets/course_screen_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String imagepath = "lib/assets/images/course2.png";

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<CourseScreen> {
  final allCourses =
  Supabase.instance.client.from('all_courses').stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_square_left),
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const BottomNav();
            }));
          },
        ),
        actions: const [
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       Stack(
          //         children: [
          //           Container(
          //             width: 40,
          //             height: 40,
          //             decoration: BoxDecoration(
          //               color: const Color.fromRGBO(236, 215, 247, 1),
          //               borderRadius: BorderRadius.circular(25),
          //             ),
          //             child: const Icon(
          //               IconsaxPlusLinear.notification,
          //               color: Color.fromRGBO(56, 15, 67, 1.0),
          //             ),
          //           ),
          //           Positioned(
          //             top: 2,
          //             right: 2,
          //             child: Container(
          //               width: 13,
          //               height: 13,
          //               decoration: BoxDecoration(
          //                 color: Colors.red,
          //                 borderRadius: BorderRadius.circular(25),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            width: 60,
            height: 40,
          ),
        ],
        title: Center(
          child: CourseUiHelper().customText(
              'Courses', 24, FontWeight.w400, Color.fromRGBO(56, 15, 67, 1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('lib/assets/images/course1.png')),
            const SizedBox(
              height: 10,
            ),
            HomeUiHelper().customText(
              'All Courses',
              24,
              FontWeight.w600,
              Color.fromRGBO(56, 15, 67, 1),
            ),
            StreamBuilder<List<Map<String, dynamic>>>(
              stream: allCourses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: AlertDialog(
                      title: const Text('Error'),
                      content: Text('${snapshot.error}'),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No Courses Available'),
                  );
                }
                final courses = snapshot.data!;
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CourseCard(
                      imageUrl: imagepath,
                      title: courses[index]['course_name'].toString(),
                      subtitle: 'Course Description',
                      review: courses[index]['course_review'] != null
                          ? courses[index]['course_review'].toDouble()
                          : 0.0,
                      fees: courses[index]['course_price'].toDouble(),
                      course_id: courses[index]['course_id'].toString(),
                      course_instructor:
                      courses[index]['course_instructor'].toString(),
                      lesson_count: courses[index]['no_of_lessons'] != null
                          ? courses[index]['no_of_lessons'].toInt()
                          : 0,
                      course_duration: courses[index]['course_duration'].toString(),
                    );
                  },
                );
              },
            ),
            FooterWidget()
          ],
        ),
      ),
    );
  }
}
