import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uuid;
  final String name;
  final String email;
  final String password;

  const UserEntity({
    required this.uuid,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props {
    return [
      uuid,
      email,
      name,
      password,
    ];
  }
}
