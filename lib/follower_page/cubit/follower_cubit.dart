import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/cache.dart';
import 'package:githubproject/models/api_error.dart';
import 'package:githubproject/models/follower.dart';
import 'package:http/http.dart' as http;

part 'follower_state.dart';

class FollowerCubit extends Cubit<FollowerState> {
  FollowerCubit() : super(LoadingFollower());

  void follower() async {
    try {
      emit(LoadingFollower());
      await Future.delayed(
        const Duration(seconds: 3),
      );
      final response = await http.get(
        Uri.parse(
          'https://api.github.com/users/${Cache.user}/followers',
        ),
      );

      if (response.statusCode == 200) {
        emit(
          SuccessFollower(
            itens: Follower.fromListJson(response.body),
          ),
        );
      }
    } catch (e) {
      emit(
        FailureFollower(
          ApiError(
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
