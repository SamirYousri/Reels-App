// models/video_model.dart

class VideoModel {
  final String url;
  final String likesCount;

  VideoModel({required this.url, required this.likesCount});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      url: json['video'],
      likesCount: json['likes_count_translated'] ?? 'Untitled',
    );
  }
}
