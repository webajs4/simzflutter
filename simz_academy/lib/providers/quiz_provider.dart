import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final quizProvider=StreamProvider<List<Map<String,dynamic>>>((ref) {
  final quizStream=Supabase.instance.client
  .from('quiz')
  .stream(primaryKey: ['id']);
  return quizStream.asyncMap((data){
    final filteredSyllabus=data.where((record)=>record['quiz_name']!=null).toList();
    return filteredSyllabus;
  });
  // final query=quizStream.from('quiz').select().order('id',ascending: true);
});