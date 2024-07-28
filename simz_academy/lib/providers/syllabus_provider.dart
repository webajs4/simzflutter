import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A provider that streams a list of syllabus records from Supabase.
///
/// The syllabus records are filtered to only include records with a non-null `name` field.
///


final syllabusProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final syllabusStream = Supabase.instance.client
      .from('syllabus')
      .stream(primaryKey: ['id']);

  return syllabusStream.asyncMap((data) {
    final filteredSyllabus = data.where((record) => record['name'] != null).toList();
    return filteredSyllabus;
  });
});