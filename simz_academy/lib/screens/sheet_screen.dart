import 'package:flutter/material.dart';

class SheetScreen extends StatelessWidget {
  const SheetScreen({Key? key}) : super(key: key);

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
