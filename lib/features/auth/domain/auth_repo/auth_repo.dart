import '../../../../core/models/result.dart';
import '../../../../core/models/user_model.dart';

abstract class AuthRepo {
  Future<Result> login(String email, String password,bool rememberMe);
}
