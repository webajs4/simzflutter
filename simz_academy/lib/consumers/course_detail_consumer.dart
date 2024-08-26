import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:iconsax_plus/iconsax_plus.dart';

//import '../UIHelper/home_ui_helper.dart';
import '../providers/course_detail_provider.dart';

class CourseDetailConsumer extends ConsumerWidget {
  const CourseDetailConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseDetailAsyncValue = ref.watch(courseDetailProvider);
    return Scaffold(
      body: Center(
        child: courseDetailAsyncValue.when(
          data: (courseDetail) {
            if (courseDetail.isEmpty) {
              return Text("No Data");
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courseDetail.length,
              itemBuilder: (context, index) {
                final cd = courseDetail[index];
                return SizedBox(
                  // width: 100,
                  // height: 100,
                  child: ListTile(
                    title: Text('${cd['lessons']}',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(27, 71, 113, 1))),
                  ),
                );
              },
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
