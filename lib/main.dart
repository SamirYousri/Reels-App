import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/features/home/presentation/manager/reels_cubit/reels_cubit.dart';
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
      home: BlocProvider(
        create: (context) => ReelsCubit()..fetchReels(),
        child: const ReelsScreen(),
      ),
    );
  }
}
