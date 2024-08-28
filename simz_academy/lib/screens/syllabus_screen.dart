/// A screen that displays the syllabus for a course.
///
/// This screen is a stateless widget that uses the [SyllabusConsumer] to fetch
/// and display the syllabus data. It also includes a custom app bar with a
/// back button and a profile picture.
///
/// Example:
///
/// ```dart
/// Navigator.of(context).push(
///   MaterialPageRoute(builder: (context) => SyllabusScreen()),
/// );
/// ```
///
/// This will push the [SyllabusScreen] onto the navigation stack.
library;

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/consumers/syllabus_consumer.dart';
import 'package:simz_academy/screens/bottom_nav.dart';

class SyllabusScreen extends StatelessWidget {
  /// Creates a new [SyllabusScreen] instance.
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: HomeUiHelper().customText('Syllabus', 24, FontWeight.w400,
                const Color.fromRGBO(56, 15, 67, 1))),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return BottomNav();
            }));
          },
          icon: const Icon(
            (Iconsax.arrow_square_left),
            color: Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
        actions: const [
          SizedBox(
            width: 60,
            height: 40,
          ),
        ],
      ),
      body: SyllabusConsumer(),
    );
  }
}
