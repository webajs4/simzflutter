import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../MediaPlayers/video_player.dart';
import '../providers/test_video_provider.dart';

class TestVideoConsumer extends ConsumerWidget {
  const TestVideoConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testVideoAsyncValue = ref.watch(testVideoProvider);
    return Scaffold(
      body: Center(
        child: testVideoAsyncValue.when(
          data: (testVideo) {
            if (testVideo.isEmpty) {
              return Text('No data');
            }
            return ListView.builder(
              itemCount: testVideo.length, // Add itemCount for proper list size
              itemBuilder: (context, index) {
                final v = testVideo[index];
                return ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return VideoPlayerScreen(
                        videoUrl: v['video_url'],
                        videoDesc: v['video_description'],
                      );
                    }));
                  },
                  title: Text('${v['video_name']}'),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
          loading: () {
            return CircularProgressIndicator(); // Add return here for the loading case
          },
        ),
      ),
    );
  }
}
