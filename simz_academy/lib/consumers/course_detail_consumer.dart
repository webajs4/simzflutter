import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../UIHelper/home_ui_helper.dart';
import '../providers/course_detail_provider.dart';

class CourseDetailConsumer extends ConsumerWidget {
  const CourseDetailConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseDetailAsyncValue = ref.watch(courseDetailProvider);
    return  Scaffold(
      body: Center(
        child: courseDetailAsyncValue.when(
          data: (courseDetail) {
            if (courseDetail.isEmpty) {
              return Text('No Course Found');
            }
            return ListView.builder(
              itemCount: courseDetail.length,
              itemBuilder: (context, index) {
                final course = courseDetail[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 12,right: 12),
                  child: Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(196, 220, 243, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        IconsaxPlusBold.wallet_1,
                        color: Color.fromRGBO(201, 144, 20, 1),
                        size: 40,
                      ),
                      title: HomeUiHelper().customText('${course['course_title']}', 20,
                          FontWeight.w600, Color.fromRGBO(27, 71, 113, 1)),
                      subtitle: HomeUiHelper().customText('${course['course_instructor']}', 15,
                          FontWeight.w300, Color.fromRGBO(27, 71, 113, 1)),
                      trailing: HomeUiHelper().customText('₹ ${course['course_id']}', 32,
                          FontWeight.w700, Color.fromRGBO(27, 71, 113, 1)),
                    ),
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
