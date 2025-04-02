import '../../../../core/models/result.dart';

abstract class AuthRepo {
  Future<Result> login(String email, String password);
}
