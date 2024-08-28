import 'package:udrive/features/auth/domain/entities/login_payload_entity.dart';
import 'package:udrive/features/auth/domain/entities/register_payload_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:udrive/core/errors/failures.dart';
import 'package:udrive/features/home/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity?>> login(LoginPayloadEntity loginPayloadEntity);
  Future<Either<Failure, void>> register(RegisterPayloadEntity registerPayloadEntity);
}
