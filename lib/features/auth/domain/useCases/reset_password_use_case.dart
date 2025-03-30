import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPasswordUseCase {
  ResetPasswordUseCase({required this.authRepo});
  AuthRepo authRepo;
  Future<Result> resetPassword(String email, String newPassword) async {
    return authRepo.resetPassword(email, newPassword);
  }
}
