import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/course_ui_helper.dart';
import 'package:simz_academy/functions/show_alert.dart';
import 'package:simz_academy/screens/course_details.dart';

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double review;
  final double fees;
  // ignore: non_constant_identifier_names
  final String course_id;
   // ignore: non_constant_identifier_names
  final String course_instructor;
  final int lesson_count;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.fees,
     // ignore: non_constant_identifier_names
    required this.course_id,
     // ignore: non_constant_identifier_names
    required this.course_instructor, required this.lesson_count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: const Color.fromRGBO(246, 235, 252, 1),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 140,
                height: 140,
                child: Image(
                  image: AssetImage(imageUrl),
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title section
                    Text(
                      title,
                      //overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                      style: GoogleFonts.blinker(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(56, 15, 67, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 6),
                      child: CourseUiHelper().customText(
                        '$review Reviews',
                        16,
                        FontWeight.normal,
                        const Color.fromRGBO(56, 15, 67, 1),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CourseUiHelper().customText(
                      '₹$fees',
                      20,
                      FontWeight.w600,
                      const Color.fromRGBO(56, 15, 67, 1),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  WidgetStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.all(8),
                              ),
                              shape:
                                  WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                const Color.fromRGBO(129, 50, 153, 1),
                              ),
                            ),
                            onPressed: () {
                              String courseName = title.toString();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetails(
                                    course_id: course_id,
                                    course_instructor: course_instructor,
                                    course_title: courseName,
                                    lesson_count: lesson_count,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                CourseUiHelper().customText(
                                  '   Buy Now  ',
                                  16,
                                  FontWeight.normal,
                                  const Color.fromRGBO(251, 246, 253, 1),
                                ),
                                const Icon(
                                  size: 20,
                                  IconsaxPlusLinear.shop,
                                  color: Color.fromRGBO(251, 246, 253, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                const Color.fromRGBO(236, 215, 247, 1),
                              ),
                            ),
                            onPressed: () {
                              showAlertBox(context, 'tel:+919072397378');
                            },
                            icon: const Icon(
                              size: 18,
                              IconsaxPlusLinear.call_calling,
                              color: Color.fromRGBO(129, 50, 153, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
