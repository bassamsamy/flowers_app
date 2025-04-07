import 'package:flowers_app/core/models/result.dart';

abstract class AuthRepo {
  Future<Result> forgetPassword(String email);
  Future<Result> verifyOtp(String code);
  Future<Result> resetPassword(String email, String newPassword);
  Future<Result> login(String email, String password, bool rememberMe);

  Future<Result> signUp(
    String firstName,
    String lastName,
    String rePassword,
    String email,
    String password,
    String phone,
    String userName,
    String gender,
  );
}
