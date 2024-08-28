import 'package:udrive/features/auth/domain/entities/login_payload_entity.dart';

class LoginPayloadModel extends LoginPayloadEntity {
  const LoginPayloadModel({
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
