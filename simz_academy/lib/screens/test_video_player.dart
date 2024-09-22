import 'package:flutter/material.dart';
import 'package:simz_academy/consumers/test_video_consumer.dart';

class TestVideoPlayer extends StatefulWidget {
  const TestVideoPlayer({super.key});

  @override
  State<TestVideoPlayer> createState() => _TestVideoPlayerState();
}

class _TestVideoPlayerState extends State<TestVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    //getUrl();
    // print(response);
    return Scaffold(
      body: TestVideoConsumer(),
    );
  }

  // Future<void> getUrl() async {
  //   final response = await Supabase.instance.client
  //       .from('test_video_player')
  //       .select('*'); // You need to execute the query
  //
  //   // Assuming that the response data is a list of maps
  //   final data = response as List<dynamic>;
  //   //print(data);
  //   for (var record in data) {
  //     print(record['video_url']); // Print each video name
  //   }
  // }
}
