// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  final String course_id;
  final String course_instructor;
  const CourseDetails({super.key, required this.course_id, required this.course_instructor});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Course ID: ${widget.course_id}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Course Instructor: ${widget.course_instructor}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}