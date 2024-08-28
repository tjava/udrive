import 'package:udrive/features/auth/domain/entities/register_payload_entity.dart';

class RegisterPayloadModel extends RegisterPayloadEntity {
  const RegisterPayloadModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory RegisterPayloadModel.fromEntity(RegisterPayloadEntity registerPayloadEntity) =>
      RegisterPayloadModel(
        name: registerPayloadEntity.name,
        email: registerPayloadEntity.email,
        password: registerPayloadEntity.password,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
