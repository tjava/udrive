import 'package:udrive/core/constants/string_constant.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:udrive/core/errors/failures.dart';
import 'package:udrive/features/auth/domain/entities/register_payload_entity.dart';
import 'package:udrive/features/auth/domain/usecases/register_usecase.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  Future<void> register(RegisterPayloadEntity registerPayloadEntity) async {
    emit(const Loading());

    final result = await registerUsecase(registerPayloadEntity);

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        }
        emit(Error(failure.message ?? kGenericError));
      },
      (_) => emit(const Loaded()),
    );
  }
}
