import 'package:flutter/material.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Screen'),
      ),
      body: const Center(
        child: Text('Exam Screen'),
      ),
    );
  }
}
