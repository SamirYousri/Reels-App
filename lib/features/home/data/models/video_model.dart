// models/video_model.dart

import 'package:hive/hive.dart';

part 'video_model.g.dart';

@HiveType(typeId: 0)
class VideoModel {
  @HiveField(0)
  final String url;

  @HiveField(1)
  final String likesCount;

  VideoModel({required this.url, required this.likesCount});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      url: json['video'],
      likesCount: json['likes_count_translated'] ?? 'Untitled',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video': url,
      'likes_count_translated': likesCount,
    };
  }
}
