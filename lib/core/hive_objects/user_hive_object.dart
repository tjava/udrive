import 'package:hive/hive.dart';
import 'package:udrive/features/home/data/models/user_model.dart';

part 'user_hive_object.g.dart';

@HiveType(typeId: 0)
class UserHiveObject extends HiveObject {
  @HiveField(0)
  final String? uuid;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? password;

  UserHiveObject({
    this.uuid,
    this.name,
    this.email,
    this.password,
  });

  UserHiveObject copyWith({
    String? uuid,
    String? name,
    String? email,
    String? password,
  }) {
    return UserHiveObject(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  static UserHiveObject? fromJson(Map<String, dynamic>? map) {
    if (map == null) return null;

    return UserHiveObject(
      uuid: map['uuid'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  @override
  String toString() {
    return 'UserHiveObject(uuid: $uuid, name: $name, email: $email, password: $password';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserHiveObject &&
        other.uuid == uuid &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
  }

  UserModel toModel() {
    return UserModel(
      uuid: uuid!,
      name: name!,
      email: email!,
      password: password!,
    );
  }

  static UserHiveObject? fromModel(UserModel? model) {
    if (model != null) {
      return UserHiveObject(
        uuid: model.uuid,
        name: model.name,
        email: model.email,
        password: model.password,
      );
    }
    return null;
  }
}
