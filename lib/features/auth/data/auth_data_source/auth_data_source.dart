import 'package:flowers_app/core/models/result.dart';

abstract class AuthDataSource {
  Future<Result> forgetPassword(String email);
  Future<Result> verifyOtp(String code);
  Future<Result> resetPassword(String email, String newPassword);

}
