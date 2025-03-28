import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/core/models/user_model.dart';

abstract class AuthDataSource {
Future<Result<UserModel>> login(String email, String password);
}