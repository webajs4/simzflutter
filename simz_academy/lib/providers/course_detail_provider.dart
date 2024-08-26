import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final courseDetailProvider = StreamProvider<List<Map<String,dynamic>>>((ref){

  final courseDetailStream = Supabase.instance.client
    .from('course_details')
    .stream(primaryKey: ['id']);

  return courseDetailStream.asyncMap((data){
    final filteredCourseDetail = data
      .where((record) => record['lessons'] != null)
      .toList();
    return filteredCourseDetail;
  });
});