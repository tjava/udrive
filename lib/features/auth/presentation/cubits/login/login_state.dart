part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

class Loading extends LoginState {
  const Loading();
}

class Loaded extends LoginState {
  final UserEntity? userEntity;
  const Loaded(this.userEntity);

  @override
  List<Object?> get props => [userEntity];
}

class Error extends LoginState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
