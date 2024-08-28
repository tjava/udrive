part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class Loading extends RegisterState {
  const Loading();
}

class Loaded extends RegisterState {
  const Loaded();
}

class Error extends RegisterState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
