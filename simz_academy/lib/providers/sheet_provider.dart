import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A StreamProvider that fetches and filters data from a Supabase 'sheets' table.
///
/// This provider creates a stream of [List<Map<String, dynamic>>] from the Supabase 'sheets' table.
/// The stream is filtered to only include records where the 'sheet_name' field is not null.
final sheetProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  /// Fetch a stream of data from the Supabase 'sheets' table, using 'id' as the primary key.
  final sheetStream = Supabase.instance.client
      .from('sheets')
      .stream(primaryKey: ['id']);

  /// Asynchronously map the incoming data stream to a new stream of filtered data.
  return sheetStream.asyncMap((data) {
    /// Filter the incoming data to only include records where the 'sheet_name' field is not null.
    final filteredSheets = data.where((record) => record['sheet_name'] != null).toList();

    /// Return the filtered data.
    return filteredSheets;
  });
});