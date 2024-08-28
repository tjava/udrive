import 'package:udrive/core/errors/exceptions.dart';
import 'package:udrive/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:udrive/features/auth/data/models/login_payload_model.dart';
import 'package:udrive/features/auth/data/models/register_payload_model.dart';
import 'package:udrive/features/auth/domain/entities/login_payload_entity.dart';
import 'package:udrive/features/auth/domain/entities/register_payload_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:udrive/core/errors/failures.dart';
import 'package:udrive/features/auth/domain/repositories/auth_repository.dart';
import 'package:udrive/features/home/domain/entities/user_entity.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDataSource;
  const AuthRepositoryImpl({
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity?>> login(LoginPayloadEntity loginPayloadEntity) async {
    try {
      final LoginPayloadModel loginPayloadModel = LoginPayloadModel(
        email: loginPayloadEntity.email,
        password: loginPayloadEntity.password,
      );

      final UserEntity? userEntity = await authLocalDataSource.login(loginPayloadModel);

      return Right<Failure, UserEntity?>(userEntity);
    } on CacheException catch (error) {
      return Left<Failure, UserEntity?>(
        GenericFailure(message: error.message),
      );
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterPayloadEntity registerPayloadEntity) async {
    try {
      await authLocalDataSource.register(RegisterPayloadModel(
        name: registerPayloadEntity.name,
        email: registerPayloadEntity.email,
        password: registerPayloadEntity.password,
      ));

      return const Right<Failure, void>(null);
    } on CacheException catch (error) {
      return Left<Failure, void>(
        GenericFailure(message: error.message),
      );
    }
  }
}
