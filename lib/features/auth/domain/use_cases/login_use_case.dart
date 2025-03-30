import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../auth_repo/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  Future<Result> call(String email, String password) =>
      _authRepo.login(email, password);
}