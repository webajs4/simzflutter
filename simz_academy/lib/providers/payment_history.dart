import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final paymentProvider=StreamProvider<List<Map<String,dynamic>>>((ref){
  final stream=Supabase.instance.client
  .from('fee')
  .stream(primaryKey: ['id'])
  .eq('status', 'Completed');

  return stream.asyncMap((data){
    final filteredData=data.where((record)=>record['user_id']=='simz36804001').toList();
    return filteredData;
  });
});