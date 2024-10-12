//ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:reels/features/home/presentation/views/widgets/build_interaction_buttons.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;
  ChewieController? chewieController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          isLoading = false;
          chewieController = ChewieController(
            videoPlayerController: controller,
            autoPlay: true,
            looping: true,
          );
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : Chewie(controller: chewieController!),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: buildInteractionButtons(),
        ),
      ],
    );
  }
}
