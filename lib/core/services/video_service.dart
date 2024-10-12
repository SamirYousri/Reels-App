import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reels/features/home/data/models/video_model.dart';

class VideoService {
  Future<List<VideoModel>> fetchVideos() async {
    final response = await http.get(
      Uri.parse('https://api.sawalef.app/api/v1/reels'),
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final List<dynamic> videoList = decodedJson['data'];
      return videoList.map((video) => VideoModel.fromJson(video)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
