part of 'follower_cubit.dart';

abstract class FollowerState extends Equatable {
  const FollowerState();

  @override
  List<Object> get props => [];
}

class LoadingFollower extends FollowerState {}

class FailureFollower extends FollowerState {
  const FailureFollower(this.error);

  final ApiError error;
}

class SuccessFollower extends FollowerState {
  SuccessFollower({
    required this.itens,
  });

  List<Follower> itens;
}
