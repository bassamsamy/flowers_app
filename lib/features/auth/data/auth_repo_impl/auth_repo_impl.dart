import 'package:flowers_app/core/models/result.dart';

import 'package:flowers_app/core/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth_repo/auth_repo.dart';
import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<Result> login(String email, String password) =>
      _authService.login(email, password);
}
