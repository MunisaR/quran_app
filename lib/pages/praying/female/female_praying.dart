// import 'package:flutter/material.dart';
// import 'package:quran_app/DRY/colors.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:visibility_detector/visibility_detector.dart';
//
// class FemalePraying extends StatefulWidget {
//   final String youtubeUrl;
//   const FemalePraying({Key? key, required this.youtubeUrl}) : super(key: key);
//
//   @override
//   State<FemalePraying> createState() => _FemalePrayingState();
// }
//
// class _FemalePrayingState extends State<FemalePraying> {
//   late YoutubePlayerController _controller;
//   String videoUrl =
//       "https://youtu.be/Naf9-NXWKqo";
//
//   final List<String> _ids = [
//     'nPt8bK2gbaU',
//   ];
//
//   @override
//   void initState() {
//     loadVideoPlayer();
//     super.initState();
//   }
//
//   loadVideoPlayer() {
//     _controller = YoutubePlayerController(
//       initialVideoId: _ids.first,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     );
//     _controller.addListener(() {
//     setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Praying'),
//         backgroundColor: primaryBg,
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             ),
//             Container(
//               //duration of video
//               child: Text(
//                   "Total Duration: " + _controller.value.duration.toString()),
//             ),
//             Container(
//                 child: VideoProgressIndicator(_controller,
//                     allowScrubbing: true,
//                     colors: VideoProgressColors(
//                       backgroundColor: Colors.redAccent,
//                       playedColor: Colors.green,
//                       bufferedColor: Colors.purple,
//                     ))),
//             Container(
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         if (_controller.value.isPlaying) {
//                           _controller.pause();
//                         } else {
//                           _controller.play();
//                         }
//
//                         setState(() {});
//                       },
//                       icon: Icon(_controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow)),
//                   IconButton(
//                       onPressed: () {
//                         _controller.seekTo(Duration(seconds: 0));
//
//                         setState(() {});
//                       },
//                       icon: Icon(Icons.stop))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
