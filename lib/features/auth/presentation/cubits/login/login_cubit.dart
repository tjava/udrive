import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:udrive/core/errors/failures.dart';
import 'package:udrive/features/auth/auth_constants.dart';
import 'package:udrive/features/auth/domain/entities/login_payload_entity.dart';
import 'package:udrive/features/auth/domain/usecases/login_usecase.dart';
import 'package:udrive/features/home/domain/entities/user_entity.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  Future<void> login(LoginPayloadEntity loginPayloadEntity) async {
    emit(const Loading());

    final result = await loginUsecase(loginPayloadEntity);

    result.fold((Failure failure) {
      if (failure is ServerFailure) {
        emit(Error(failure.message!));
      }
      emit(Error(failure.message!));
    }, (UserEntity? userEntity) {
      if (userEntity == null) {
        emit(const Error(kLoginError));
      } else {
        emit(Loaded(userEntity));
      }
    });
  }
}
