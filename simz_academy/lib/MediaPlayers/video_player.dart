import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoDesc;
  final String videoUrl;
  const VideoPlayerScreen({super.key, required this.videoUrl, required this.videoDesc});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initPlayer(); // Initialize the video player
  }

  void _initPlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    // Initialize the video player and call setState when done
    await _videoPlayerController.initialize();

    // After the video player is initialized, set up the ChewieController
    setState(() {
      chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Color(0xFF5B2867),       // Color of the played portion
          handleColor: Color(0xFF9A40B9), // Color of the slider handle
          backgroundColor: Colors.grey,  // Background color of the slider
          bufferedColor: Color(0xFFFEE2E4), // Color of the buffered portion
        ),
        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Description'),
                    content: Text(widget.videoDesc),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                });
              },
              iconData: Icons.description,
              title: 'Description',
            ),
          ];
        },
      );
    });

    WakelockPlus.enable(); // Keep the screen on while the video is playing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: chewieController != null
          ? Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Chewie(controller: chewieController!),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose(); // Dispose the controller to free up resources
    chewieController?.dispose();
    WakelockPlus.disable(); // Disable the wakelock when the video is done
    super.dispose();
  }
}
