import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/services/video_cache_service.dart';
import 'package:reels/core/services/video_service.dart';
import 'package:reels/features/home/presentation/manager/reels_cubit/reels_cubit.dart';
import 'package:reels/features/home/presentation/views/widgets/reels_screen_view_body.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels'),
      ),
      body: BlocProvider(
        create: (context) =>
            ReelsCubit(VideoService(), VideoCacheService())..loadVideos(),
        child: const ReelsScreenViewBody(),
      ),
    );
  }
}
