part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class LoadingSearch extends SearchState {}

class FailureSearch extends SearchState {
  final ApiError error;

  const FailureSearch(this.error);
}
