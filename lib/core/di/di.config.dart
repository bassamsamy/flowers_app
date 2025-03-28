// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/auth_data_source/auth_data_source.dart'
    as _i410;
import '../../features/auth/data/auth_data_source_impl/auth_data_source_impl.dart'
    as _i651;
import '../../features/auth/data/auth_repo_impl/auth_repo_impl.dart' as _i574;
import '../../features/auth/domain/auth_repo/auth_repo.dart' as _i649;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../api_manager/api_manger.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.singleton<_i811.ApiManager>(() => _i811.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i410.AuthDataSource>(
        () => _i651.AuthDataSourceImpl(gh<_i811.ApiManager>()));
    gh.factory<_i649.AuthRepo>(
        () => _i574.AuthRepoImpl(gh<_i410.AuthDataSource>()));
    gh.factory<_i1038.LoginUseCase>(
        () => _i1038.LoginUseCase(gh<_i649.AuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i811.RegisterModule {}
