import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: IconButton(
        icon: Icon(IconsaxPlusBold.arrow),
        onPressed: () {},
      ),
      title: Text('Courses'),
    ));
  }
}
