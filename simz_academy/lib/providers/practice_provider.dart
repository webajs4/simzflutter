import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A StreamProvider that fetches and filters data from the 'practise' table in Supabase.
///
/// This provider creates a stream of [List<Map<String,dynamic>>] from the 'practise' table.
/// The stream is filtered to only include records where the 'practise_name' field is not null.
final practiseProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  /// Fetching a stream of data from the 'practise' table in Supabase.
  /// The stream is ordered by the 'id' field.
  final practiseStream = Supabase.instance.client
      .from('practise')
      .stream(primaryKey: ['id']);

  /// Mapping the incoming stream of data to a new stream of filtered data.
  /// The filter removes any records where the 'practise_name' field is null.
  return practiseStream.asyncMap((data) {
    final filteredPractise = data
        .where((record) => record['practise_name'] != null)
        .toList();
    return filteredPractise;
  });
});