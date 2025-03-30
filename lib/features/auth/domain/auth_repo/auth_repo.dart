import 'package:flowers_app/core/models/result.dart';
import '../../../../core/models/result.dart';
import '../../../../core/models/user_model.dart';
abstract class AuthRepo {
  Future<Result> forgetPassword(String email);
  Future<Result> verifyOtp(String code);
  Future<Result> resetPassword(String email, String newPassword);
  Future<Result> login(String email, String password,bool rememberMe);
}

