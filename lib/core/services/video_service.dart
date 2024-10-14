import 'package:dio/dio.dart';
import 'package:reels/features/home/data/models/video_model.dart';

class VideoService {
  final Dio dio = Dio();

  Future<List<VideoModel>> fetchVideos() async {
    final response = await dio.get('https://api.sawalef.app/api/v1/reels');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((json) => VideoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
