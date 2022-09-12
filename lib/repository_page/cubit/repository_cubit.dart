import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/cache.dart';
import 'package:githubproject/models/api_error.dart';
import 'package:githubproject/models/repository.dart';
import 'package:http/http.dart' as http;

part 'repository_state.dart';

class RepositoryCubit extends Cubit<RepositoryState> {
  RepositoryCubit() : super(LoadingRepository());

  void repository() async {
    try {
      emit(LoadingRepository());
      await Future.delayed(
        const Duration(seconds: 3),
      );
      final response = await http.get(
        Uri.parse('https://api.github.com/users/${Cache.user}/repos'),
      );

      if (response.statusCode == 200) {
        emit(
          SuccessRepository(
            itens: Repository.fromListJson(response.body),
          ),
        );
      }
    } catch (e) {
      emit(
        FailureRepository(
          ApiError(
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
