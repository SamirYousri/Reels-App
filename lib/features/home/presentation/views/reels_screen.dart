import 'package:flutter/material.dart';
import 'package:reels/features/home/presentation/views/widgets/reels_screen_view_body.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels'),
      ),
      body: const ReelsScreenViewBody(),
    );
  }
}
