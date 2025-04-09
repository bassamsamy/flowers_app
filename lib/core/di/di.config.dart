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
import '../../features/home/data/home_data_source/home_data_source.dart'
    as _i772;
import '../../features/home/data/home_data_source_impl/home_data_source_impl.dart'
    as _i1009;
import '../../features/home/data/home_repo_impl/home_repo_impl.dart' as _i989;
import '../../features/home/domain/home_repo/home_repo.dart' as _i8;
import '../../features/home/domain/useCases/get_best_seller_use_case.dart'
    as _i1001;
import '../../features/home/domain/useCases/get_categories_use_case.dart'
    as _i1002;
import '../../features/home/domain/useCases/get_occasions_use_case.dart'
    as _i899;
import '../../features/home/presentation/cubits/HomeCubit.dart' as _i538;
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
    gh.lazySingleton<_i772.HomeDataSource>(
        () => _i1009.HomeDataSourceImpl(apiManager: gh<_i811.ApiManager>()));
    gh.factory<_i649.AuthRepo>(
        () => _i574.AuthRepoImpl(authDataSource: gh<_i410.AuthDataSource>()));
    gh.lazySingleton<_i8.HomeRepo>(
        () => _i989.HomeRepoImpl(dataSource: gh<_i772.HomeDataSource>()));
    gh.factory<_i617.LoginUseCase>(
        () => _i617.LoginUseCase(gh<_i649.AuthRepo>()));
    gh.factory<_i1001.GetBestSellerUseCase>(
        () => _i1001.GetBestSellerUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i1002.GetCategoriesUseCase>(
        () => _i1002.GetCategoriesUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i899.GetOccasionsUseCase>(
        () => _i899.GetOccasionsUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i438.ForgetPasswordUseCase>(
        () => _i438.ForgetPasswordUseCase(authRepo: gh<_i649.AuthRepo>()));
    gh.factory<_i799.ResetPasswordUseCase>(
        () => _i799.ResetPasswordUseCase(authRepo: gh<_i649.AuthRepo>()));
    gh.factory<_i661.VerifyOtpUseCase>(
        () => _i661.VerifyOtpUseCase(authRepo: gh<_i649.AuthRepo>()));
    gh.factory<_i538.HomeCubit>(() => _i538.HomeCubit(
          getAllCategoriesUseCase: gh<_i1002.GetCategoriesUseCase>(),
          getBestSellerUseCase: gh<_i1001.GetBestSellerUseCase>(),
          getAllOccasionsUseCase: gh<_i899.GetOccasionsUseCase>(),
        ));
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
