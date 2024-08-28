import 'package:udrive/features/auth/domain/entities/register_payload_entity.dart';
import 'package:udrive/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:udrive/core/errors/failures.dart';
import 'package:udrive/core/usecase/usecase.dart';

@LazySingleton()
class RegisterUsecase extends UsecaseWithParams<void, RegisterPayloadEntity> {
  final AuthRepository authRepository;

  RegisterUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(RegisterPayloadEntity params) {
    return authRepository.register(params);
  }
}
