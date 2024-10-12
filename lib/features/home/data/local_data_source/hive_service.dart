// services/hive_service.dart

import 'package:hive/hive.dart';
import '../models/video_model.dart';

class HiveService {
  final Box<VideoModel> box = Hive.box<VideoModel>('video_cache');

  Future<void> saveVideo(VideoModel video) async {
    await box.put(video.url, video);
  }

  // VideoModel? getVideo(String url) {
  //   return box.get(url);
  // }

  List<VideoModel> getAllVideos() {
    return box.values.toList();
  }
}
