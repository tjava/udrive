import 'package:equatable/equatable.dart';

class RegisterPayloadEntity extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterPayloadEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props {
    return [
      email,
      name,
      password,
    ];
  }
}
