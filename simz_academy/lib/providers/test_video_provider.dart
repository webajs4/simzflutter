import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final testVideoProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final testVideoStream = Supabase.instance.client
      .from('test_video_player')
      .stream(primaryKey: ['id']);
  return testVideoStream.asyncMap((data) {
    final filteredVideo =
        data.where((record) => record['video_url'] != null).toList();
    return filteredVideo;
  });
});