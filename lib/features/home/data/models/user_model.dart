import 'package:udrive/features/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uuid,
    required super.name,
    required super.email,
    required super.password,
  });

  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
        uuid: userEntity.uuid,
        name: userEntity.name,
        email: userEntity.email,
        password: userEntity.password,
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "email": email,
        "password": password,
      };
}
