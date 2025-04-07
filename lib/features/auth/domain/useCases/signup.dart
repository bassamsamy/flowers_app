import 'package:injectable/injectable.dart';
import '../../../../core/models/result.dart';
import '../auth_repo/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepo authRepo;

  SignUpUseCase({required this.authRepo});

  Future<Result> call(
      String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String userName,
      String gender,
      String rePassword) async {
    return authRepo.signUp(
      firstName,
      lastName,
      email,
      password,
      phone,
      userName,
      gender,
      rePassword,
    );
  }
}
