import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/core/models/user_model.dart';

abstract class AuthDataSource {
  Future<Result> login(String email, String password, bool rememberMe);
}
