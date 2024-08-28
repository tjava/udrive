// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;
import 'package:udrive/core/services/third_party_services_module.dart' as _i13;
import 'package:udrive/features/auth/data/datasources/auth_local_datasource.dart'
    as _i6;
import 'package:udrive/features/auth/data/repositories/auth_repository_impl.dart'
    as _i8;
import 'package:udrive/features/auth/domain/repositories/auth_repository.dart'
    as _i7;
import 'package:udrive/features/auth/domain/usecases/login_usecase.dart'
    as _i10;
import 'package:udrive/features/auth/domain/usecases/register_usecase.dart'
    as _i9;
import 'package:udrive/features/auth/presentation/cubits/login/login_cubit.dart'
    as _i12;
import 'package:udrive/features/auth/presentation/cubits/register/register_cubit.dart'
    as _i11;
import 'package:uuid/uuid.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.Uuid>(() => thirdPartyServicesModule.uuid);
  gh.lazySingleton<_i4.HiveInterface>(() => thirdPartyServicesModule.hive);
  await gh.lazySingletonAsync<_i5.SharedPreferences>(
    () => thirdPartyServicesModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.AuthLocalDatasource>(() => _i6.AuthLocalDatasourceImpl(
        uuid: gh<_i3.Uuid>(),
        hiveInterface: gh<_i4.HiveInterface>(),
        sharedPreferences: gh<_i5.SharedPreferences>(),
      ));
  gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
      authLocalDataSource: gh<_i6.AuthLocalDatasource>()));
  gh.lazySingleton<_i9.RegisterUsecase>(
      () => _i9.RegisterUsecase(authRepository: gh<_i7.AuthRepository>()));
  gh.lazySingleton<_i10.LoginUsecase>(
      () => _i10.LoginUsecase(authRepository: gh<_i7.AuthRepository>()));
  gh.factory<_i11.RegisterCubit>(
      () => _i11.RegisterCubit(gh<_i9.RegisterUsecase>()));
  gh.factory<_i12.LoginCubit>(() => _i12.LoginCubit(gh<_i10.LoginUsecase>()));
  return getIt;
}

class _$ThirdPartyServicesModule extends _i13.ThirdPartyServicesModule {}
