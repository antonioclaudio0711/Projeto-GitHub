import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/cache.dart';
import 'package:githubproject/models/api_error.dart';
import 'package:http/http.dart' as http;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  String user = '';

  void login(BuildContext context) async {
    try {
      emit(LoadingSearch());
      await Future.delayed(
        const Duration(seconds: 3),
      );
      final response = await http.get(
        Uri.parse('https://api.github.com/users/$user'),
      );
      if (response.statusCode == 200) {
        Cache.user = user;
        Navigator.pushNamed(context, '/entrada');
      } else {
        emit(FailureSearch(
          ApiError.fromJson(response.body),
        ));
      }
    } catch (e) {
      emit(
        FailureSearch(ApiError(
          message: e.toString(),
        )),
      );
    }
  }
}
