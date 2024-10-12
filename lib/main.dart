import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reels/features/home/data/models/video_model.dart';
import 'package:reels/features/home/presentation/views/reels_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(VideoModelAdapter());
  await Hive.openBox<VideoModel>('video_cache');
  runApp(const ReelsApp());
}

class ReelsApp extends StatelessWidget {
  const ReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reels App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReelsScreen(),
    );
  }
}
