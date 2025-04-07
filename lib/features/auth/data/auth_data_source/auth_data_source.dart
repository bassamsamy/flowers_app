import 'package:flowers_app/core/models/result.dart';

abstract class AuthDataSource {
  Future<Result> forgetPassword(String email);
  Future<Result> verifyOtp(String code);
  Future<Result> resetPassword(String email, String newPassword);
  Future<Result> login(String email, String password, bool rememberMe);
  Future<Result<Result>> gatCategory(String name, String image, String id);

  Future<Result> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String phone,
    String userName,
    String gender,
    String rePassword,
  );
}
