import 'package:reels/features/home/data/models/video_model.dart';

abstract class ReelsState {}

class ReelsInitial extends ReelsState {}

class ReelsLoading extends ReelsState {}

class ReelsLoaded extends ReelsState {
  final List<VideoModel> videos;

  ReelsLoaded(this.videos);
}

class ReelsError extends ReelsState {
  final String errmessage;

  ReelsError(this.errmessage);
}
