import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final qrProvider = StreamProvider<List<Map<String,dynamic>>>((ref){

  final qrStream = Supabase.instance.client
    .from('qr_code_call')
    .stream(primaryKey: ['id']);

  return qrStream.asyncMap((data){
    final filteredQr = data
      .where((record) => record['contact_number'] != null)
      .toList();
    return filteredQr;
  });
});