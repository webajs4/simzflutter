import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/course_ui_helper.dart';

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double review;
  final double fees;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.fees,
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        ElevatedButton(
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(16),
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
                          onPressed: () {},
                          child: Row(
                            children: [
                              CourseUiHelper().customText(
                                'Buy Now   ',
                                16,
                                FontWeight.normal,
                                const Color.fromRGBO(251, 246, 253, 1),
                              ),
                              const Icon(
                                IconsaxPlusLinear.shop,
                                color: Color.fromRGBO(251, 246, 253, 1),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
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
                            onPressed: () {},
                            icon: const Icon(
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
