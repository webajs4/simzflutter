// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/course_ui_helper.dart';
import 'package:simz_academy/functions/show_alert.dart';
import 'package:simz_academy/screens/course_details.dart';
import 'package:simz_academy/screens/qr_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../UIHelper/home_ui_helper.dart';
import '../screens/payment_conformation_screen.dart';

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double review;
  final double fees;

  final String course_id;

  final String course_instructor;
  final int lesson_count;
  final String course_duration;
  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.fees,
    required this.course_id,
    required this.course_instructor,
    required this.lesson_count,
    required this.course_duration,
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
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
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
                                    course_duration: course_duration,
                                    coursePrice: fees.toString(),
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
                              if (kIsWeb ||
                                  kIsWasm ||
                                  Platform.isLinux ||
                                  Platform.isWindows ||
                                  Platform.isMacOS) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return QrScreen();
                                    },
                                  ),
                                );
                              } else {
                                showAlertBox(context, 'tel:+919072397378');
                              }
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

class CourseDescription extends StatefulWidget {
  final String courseId;
  const CourseDescription({super.key, required this.courseId});

  @override
  State<CourseDescription> createState() => _CourseDescriptionState();
}

class _CourseDescriptionState extends State<CourseDescription> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          HomeUiHelper().customText(
            'Description',
            20,
            FontWeight.w600,
            Color(0xFF380F43),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<String>(
              future: getDescription(), // Fetch description asynchronously
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator while waiting
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Handle error case
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // Render the description when data is available
                  return SizedBox(
                    child: HomeUiHelper().customText(
                      snapshot.data!, // Safely access the description
                      16,
                      FontWeight.w400,
                      const Color(0xFF380F43),
                    ),
                  );
                } else {
                  // Handle case where there's no data
                  return const Center(child: Text('No description available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getDescription() async {
    final response = await Supabase.instance.client
        .from('all_courses')
        .select('course_description')
        .eq('course_id', widget.courseId)
        .single(); // Ensures a single row is returned

    final description = response['course_description'] as String;

    //print(description);

    return description;
  }
}

class BuyNow extends StatelessWidget {
  final String courseName;
  final String coursePrice;
  const BuyNow({super.key, required this.courseName, required this.coursePrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(8),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromRGBO(129, 50, 153, 1),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return PaymentConformationScreen(
              courseName: courseName.toString(),
              coursePrice: coursePrice.toString(),
            );
          }));
        },
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centering content in the button
          children: [
            CourseUiHelper().customText(
              'Buy Now ',
              16,
              FontWeight.normal,
              const Color.fromRGBO(251, 246, 253, 1),
            ),
            const Icon(
              IconsaxPlusLinear.shop,
              size: 20,
              color: Color.fromRGBO(251, 246, 253, 1),
            ),
          ],
        ),
      ),
    );
  }
}
