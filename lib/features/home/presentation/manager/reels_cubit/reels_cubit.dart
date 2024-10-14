import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/services/video_cache_service.dart';
import 'package:reels/core/services/video_service.dart';
import 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final VideoService videoService;
  final VideoCacheService cacheService;

  ReelsCubit(this.videoService, this.cacheService) : super(ReelsInitial());

  Future<void> loadVideos() async {
    emit(ReelsLoading());

    try {
      final videos = await videoService.fetchVideos();
      for (var video in videos) {
        await cacheService.downloadAndCacheVideo(video.url); // تحميل مسبق
      }
      emit(ReelsLoaded(videos));
    } catch (e) {
      emit(ReelsError('Failed to fetch videos: $e'));
    }
  }
}
