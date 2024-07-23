import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A Riverpod provider that streams a list of fees from Supabase
/// where the status is 'Not Completed' and the user_id is 'simz36804001'.
///
/// Example:
/// ```dart
/// final fees = ref.watch(feeProvider);
/// ```
final feeProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final stream = Supabase.instance.client
    .from('fee')
    .stream(primaryKey: ['id'])
    .eq('status', 'Not Completed'); 

  return stream.asyncMap((data) {
    // Filter out records where 'user_id' is not null
    final filteredData = data.where((record) => record['user_id'] =='simz36804001').toList();
    return filteredData;
  });
});