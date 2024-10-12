//ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:reels/features/home/data/local_data_source/hive_service.dart';
import 'package:reels/features/home/presentation/views/widgets/build_interaction_buttons.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String nextVideoUrl;

  const VideoPlayerWidget(
      {super.key, required this.videoUrl, required this.nextVideoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;
  ChewieController? chewieController;
  late VideoPlayerController nextController;
  bool isLoading = true;
  final HiveService hiveService = HiveService();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  Future<void> _initializeControllers() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    nextController =
        VideoPlayerController.networkUrl(Uri.parse(widget.nextVideoUrl));

    await controller.initialize();
    await nextController.initialize();

    setState(() {
      isLoading = false;
      chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        looping: true,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController?.dispose();
    nextController.dispose();
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
