import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
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
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: courseDetail.length,
            itemBuilder: (context, index) {
              final cd = courseDetail[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color(0xFFF6EBFC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: HomeUiHelper().customText(
                    getIndex(index),
                    24,
                    FontWeight.w600,
                    Color(0xFF380F43),
                  ),
                  title: HomeUiHelper().customText(
                    '${cd['lessons']}',
                    24,
                    FontWeight.w400,
                    Color(0xFF380F43),
                  ),
                  trailing: HomeUiHelper().customText(
                    '${cd['lesson_duration']} mins',
                    18,
                    FontWeight.w400,
                    Color(0xFF380F43),
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

  String getIndex(int index) {
    String returnIndex;
    if (index < 9) {
      returnIndex = "0${index + 1}.";
    } else {
      returnIndex = "$index.";
    }
    return returnIndex;
  }
}