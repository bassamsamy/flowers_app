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
import '../../features/auth/domain/useCases/forget_password_use_case.dart'
    as _i438;
import '../../features/auth/domain/useCases/login_use_case.dart' as _i617;
import '../../features/auth/domain/useCases/reset_password_use_case.dart'
    as _i799;
import '../../features/auth/domain/useCases/verify_otp_use_case.dart' as _i661;
import '../../features/auth/presentation/cubits/forget_password_cubtit/forget_password_cubit.dart'
    as _i351;
import '../../features/auth/presentation/cubits/opt_verify_cubit/otp_verify_cubit.dart'
    as _i622;
import '../../features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart'
    as _i374;
import '../../features/splash/data/auto_login_data_source/auto_login_data_source.dart'
    as _i537;
import '../../features/splash/data/auto_login_data_source_imp/auto_login_data_source_impl.dart'
    as _i975;
import '../../features/splash/data/auto_login_repo_imp/auto_login_repo_imp.dart'
    as _i146;
import '../../features/splash/domain/auto_login_repo/auto_login_repo.dart'
    as _i372;
import '../../features/splash/domain/use_cases/get_user_data.dart' as _i595;
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
        () => _i651.AuthDataSourceImpl(apiManager: gh<_i811.ApiManager>()));
    gh.factory<_i537.AutoLoginDataSource>(
        () => _i975.AutoLoginDataSourceImp(gh<_i811.ApiManager>()));
    gh.factory<_i372.AutoLoginRepo>(
        () => _i146.AutoLoginRepoImp(gh<_i537.AutoLoginDataSource>()));
    gh.factory<_i595.GetUserDataUseCase>(
        () => _i595.GetUserDataUseCase(gh<_i372.AutoLoginRepo>()));
    gh.factory<_i649.AuthRepo>(
        () => _i574.AuthRepoImpl(authDataSource: gh<_i410.AuthDataSource>()));
    gh.factory<_i617.LoginUseCase>(
        () => _i617.LoginUseCase(gh<_i649.AuthRepo>()));
    gh.factory<_i438.ForgetPasswordUseCase>(
        () => _i438.ForgetPasswordUseCase(authRepo: gh<_i649.AuthRepo>()));
    gh.factory<_i661.VerifyOtpUseCase>(
        () => _i661.VerifyOtpUseCase(authRepo: gh<_i649.AuthRepo>()));
    gh.factory<_i799.ResetPasswordUseCase>(
        () => _i799.ResetPasswordUseCase(authRepo: gh<_i649.AuthRepo>()));
    gh.factory<_i622.OtpVerifyViewModel>(() => _i622.OtpVerifyViewModel(
        verifyOtpUseCase: gh<_i661.VerifyOtpUseCase>()));
    gh.factory<_i351.ForgetPasswordViewModel>(() =>
        _i351.ForgetPasswordViewModel(
            forgetPasswordUseCase: gh<_i438.ForgetPasswordUseCase>()));
    gh.factory<_i374.ResetPasswordViewModel>(() => _i374.ResetPasswordViewModel(
        resetPasswordUseCase: gh<_i799.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i811.RegisterModule {}
