import 'package:flutter/material.dart';
import 'package:reels/features/home/presentation/views/reels_screen.dart';

void main() {
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
