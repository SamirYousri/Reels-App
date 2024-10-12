// viewmodels/reels_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/services/video_service.dart';
import 'package:reels/features/home/data/local_data_source/hive_service.dart';
import 'package:reels/features/home/data/models/video_model.dart';

import 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final VideoService videoService;
  final HiveService hiveService;

  ReelsCubit(this.videoService, this.hiveService) : super(ReelsInitial());

  Future<void> fetchVideos() async {
    emit(ReelsLoading());

    try {
      final List<VideoModel> videos = await videoService.fetchVideos();

      for (var video in videos) {
        await hiveService.saveVideo(video);
      }

      emit(ReelsLoaded(videos));
    } catch (e) {
      final cachedVideos = hiveService.getAllVideos();
      if (cachedVideos.isNotEmpty) {
        emit(ReelsLoaded(cachedVideos));
      } else {
        emit(ReelsError('Failed to fetch videos: $e'));
      }
    }
  }
}
