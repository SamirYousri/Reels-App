// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:reels/features/home/presentation/manager/reels_cubit/reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit() : super(ReelsInitial());

  Future<void> fetchReels() async {
    try {
      emit(ReelsLoading());
      final response =
          await http.get(Uri.parse('https://api.sawalef.app/api/v1/reels'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data['data'] != null) {
          // final List<String> videos =
          //     List<String>.from(data['data'].map((item) => item['video']));

          List<dynamic> videoData = data['data'];
          List<String> videos = [];
          for (var item in videoData) {
            videos.add(item['video']);
          }

          emit(ReelsLoaded(videos));
        } else {
          emit(ReelsError('No videos available'));
        }
      } else {
        emit(ReelsError('Failed to load reels'));
      }
    } catch (e) {
      emit(ReelsError('Error: $e'));
    }
  }
}
