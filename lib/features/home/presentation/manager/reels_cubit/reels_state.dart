abstract class ReelsState {}

class ReelsInitial extends ReelsState {}

class ReelsLoading extends ReelsState {}

class ReelsLoaded extends ReelsState {
  final List<String> videos;

  ReelsLoaded(this.videos);
}

class ReelsError extends ReelsState {
  final String error;

  ReelsError(this.error);
}
