import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  const VideoPlayer({super.key, required this.videoUrl});
  
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:widget.videoUrl,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(controller:_controller ,)
    );
  }
}