import 'package:udrive/features/auth/domain/entities/login_payload_entity.dart';
import 'package:udrive/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:udrive/core/errors/failures.dart';
import 'package:udrive/core/usecase/usecase.dart';
import 'package:udrive/features/home/domain/entities/user_entity.dart';

@LazySingleton()
class LoginUsecase extends UsecaseWithParams<UserEntity?, LoginPayloadEntity> {
  final AuthRepository authRepository;

  LoginUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserEntity?>> call(LoginPayloadEntity params) {
    return authRepository.login(params);
  }
}
