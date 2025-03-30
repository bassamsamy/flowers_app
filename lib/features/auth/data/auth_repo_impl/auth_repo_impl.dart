import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/auth/data/auth_data_source/auth_data_source.dart';
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
