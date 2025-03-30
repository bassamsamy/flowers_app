import 'package:flowers_app/core/models/result.dart';

abstract class AuthRepo {
  Future<Result> forgetPassword(String email);
  Future<Result> verifyOtp(String code);
  Future<Result> resetPassword(String email, String newPassword);

}
