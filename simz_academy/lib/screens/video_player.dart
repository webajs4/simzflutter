// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// //import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// // ignore: must_be_immutable
// class VideoPlayer extends StatefulWidget {
//   final String videoUrl;
//   final String title;
//   const VideoPlayer({super.key, required this.videoUrl, required this.title});

//   @override
//   State<VideoPlayer> createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer> {

//   void _launchURL(Uri uri, bool inApp) async {
//     try {
//       if (await canLaunchUrl(uri)) {
//         if (inApp) {
//           await launchUrl(
//             uri,
//             mode: LaunchMode.inAppWebView,
//           );
//         } else {
//           await launchUrl(
//             uri,
//             mode: LaunchMode.externalApplication,
//           );
//         }
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//   // late YoutubePlayerController _controller;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _controller = YoutubePlayerController(
//   //     initialVideoId: widget.videoUrl,
//   //     flags: const YoutubePlayerFlags(
//   //       autoPlay: true,
//   //       mute: false,
//   //     ),
//   //   );
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //       body: Center(
//   //     child: Center(
//   //         child: YoutubePlayer(
//   //       controller: _controller,
//   //     )),
//   //   ));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     String url=('https://www.youtube.com/watch?v=${widget.videoUrl}');
//     _launchURL(Uri.parse(url), true);
//     return Scaffold(
//     );
//   }
// }
