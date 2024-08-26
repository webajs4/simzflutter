import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simz_academy/providers/course_detail_provider.dart';

class CourseDetailConsumer extends ConsumerWidget {
  const CourseDetailConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseDetailAsyncValue = ref.watch(courseDetailProvider);
    return Scaffold(
      body: courseDetailAsyncValue.when(
        data: (courseDetail) {
          if (courseDetail.isEmpty) {
            return const Text("No Data");
          }
          return ListView.builder(
            shrinkWrap: true, 
            physics: const NeverScrollableScrollPhysics(), 
            itemCount: courseDetail.length,
            itemBuilder: (context, index) {
              final cd = courseDetail[index];
              return ListTile(
                title: Text(
                  '${cd['lessons']}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(27, 71, 113, 1),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stack) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
