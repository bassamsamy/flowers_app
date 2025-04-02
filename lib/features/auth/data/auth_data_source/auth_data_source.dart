import 'package:flowers_app/core/models/result.dart';

abstract class AuthDataSource {
  Future<Result> login(String email, String password);
}
