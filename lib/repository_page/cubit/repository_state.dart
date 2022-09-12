part of 'repository_cubit.dart';

abstract class RepositoryState extends Equatable {
  const RepositoryState();

  @override
  List<Object> get props => [];
}

class LoadingRepository extends RepositoryState {}

class FailureRepository extends RepositoryState {
  const FailureRepository(this.error);

  final ApiError error;
}

class SuccessRepository extends RepositoryState {
  SuccessRepository({
    required this.itens,
  });

  List<Repository> itens;
}
