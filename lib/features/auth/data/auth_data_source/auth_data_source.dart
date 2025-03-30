import 'package:flowers_app/core/models/result.dart';

import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/core/models/user_model.dart';

abstract class AuthDataSource {
  Future<Result> forgetPassword(String email);
  Future<Result> verifyOtp(String code);
  Future<Result> resetPassword(String email, String newPassword);

  Future<Result> login(String email, String password, bool rememberMe);
}