import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class VideoCacheService {
  final Dio dio = Dio();

  Future<File> downloadAndCacheVideo(String url) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/${Uri.parse(url).pathSegments.last}';
    final cachedFile = File(filePath);

    if (await cachedFile.exists()) {
      return cachedFile;
    }

    final response = await dio.download(url, filePath);
    if (response.statusCode == 200) {
      return cachedFile;
    } else {
      throw Exception('Failed to download video');
    }
  }
}
