import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/auth/data/auth_data_source/auth_data_source.dart';
import 'package:injectable/injectable.dart';

import 'package:flowers_app/core/models/result.dart';

import 'package:flowers_app/core/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth_repo/auth_repo.dart';
@Injectable(as:AuthRepo)
class AuthRepoImpl  implements AuthRepo {
  AuthRepoImpl({required this.authDataSource});
  AuthDataSource authDataSource;
  @override
  Future<Result> forgetPassword(String email) {
    return authDataSource.forgetPassword(email);
  }
  
  @override
  Future<Result> verifyOtp(String code) {
    return authDataSource.verifyOtp(code);
  }
  
  @override
  Future<Result> resetPassword(String email, String newPassword) {
    return authDataSource.resetPassword(email, newPassword);
  }
  
}
import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<Result> login(String email, String password, bool rememberMe) =>
      _authService.login(email, password, rememberMe);
}
