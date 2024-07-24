import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final syllabusProvider=StreamProvider<List<Map<String,dynamic>>>((ref){
  final syllabusStream=Supabase.instance.client
  .from('syllabus')
  .stream(primaryKey: ['id']);

  return syllabusStream.asyncMap((data){
    final filteredSyllabus=data.where((record)=>record['name']!=null).toList();
    return filteredSyllabus;
  });
});