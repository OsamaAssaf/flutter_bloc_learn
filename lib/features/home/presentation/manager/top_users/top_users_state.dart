part of 'top_users_cubit.dart';

@immutable
sealed class TopUsersState {}

final class TopUsersInitial extends TopUsersState {}

final class TopUsersLoading extends TopUsersState {}

final class TopUsersSuccess extends TopUsersState {
  final List<UserModel> users;

  TopUsersSuccess(this.users);
}

final class TopUsersFailure extends TopUsersState {
  final String errorMessage;

  TopUsersFailure(this.errorMessage);
}
