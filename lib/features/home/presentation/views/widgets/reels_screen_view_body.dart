import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/features/home/presentation/manager/reels_cubit/reels_cubit.dart';
import 'package:reels/features/home/presentation/manager/reels_cubit/reels_state.dart';
import 'package:reels/features/home/presentation/views/widgets/video_player_widget.dart';

class ReelsScreenViewBody extends StatelessWidget {
  const ReelsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReelsCubit, ReelsState>(
      builder: (context, state) {
        if (state is ReelsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReelsLoaded) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.videos.length,
            itemBuilder: (context, index) {
              return VideoPlayerWidget(
                videoUrl: state.videos[index].url,
              );
            },
          );
        } else if (state is ReelsError) {
          return Center(child: Text(state.errmessage));
        } else {
          return const Center(child: Text('No reels available'));
        }
      },
    );
  }
}
