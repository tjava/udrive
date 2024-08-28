import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:udrive/core/constants/db_constant.dart';
import 'package:udrive/core/errors/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udrive/core/hive_objects/user_hive_object.dart';
import 'package:udrive/features/auth/data/models/login_payload_model.dart';
import 'package:udrive/features/auth/data/models/register_payload_model.dart';
import 'package:udrive/features/home/data/models/user_model.dart';
import 'package:uuid/uuid.dart';

abstract class AuthLocalDatasource {
  Future<void> register(RegisterPayloadModel registerPayloadModel);
  Future<UserModel?> login(LoginPayloadModel loginPayloadModel);
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final Uuid uuid;
  final HiveInterface hiveInterface;
  final SharedPreferences sharedPreferences;
  late Box<UserHiveObject> userBox;

  AuthLocalDatasourceImpl({
    required this.uuid,
    required this.hiveInterface,
    required this.sharedPreferences,
  });

  void initBox() {
    userBox = hiveInterface.box<UserHiveObject>(usersBox);
  }

  @override
  Future<void> register(RegisterPayloadModel registerPayloadModel) async {
    try {
      final hashedPassword = hashPassword(registerPayloadModel.password);
      final user = UserHiveObject(
        uuid: uuid.v4(),
        name: registerPayloadModel.name,
        email: registerPayloadModel.email,
        password: hashedPassword,
      );
      userBox = hiveInterface.box<UserHiveObject>(usersBox);
      return await userBox.put(user.email, user);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> login(LoginPayloadModel loginPayloadModel) async {
    try {
      userBox = hiveInterface.box<UserHiveObject>(usersBox);

      final passwordHash = hashPassword(loginPayloadModel.password);
      final user = userBox.get(loginPayloadModel.email);

      if (user != null && user.password == passwordHash) {
        return user.toModel();
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
