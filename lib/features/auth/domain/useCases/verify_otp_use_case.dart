import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyOtpUseCase {
  VerifyOtpUseCase({required this.authRepo});
  AuthRepo authRepo;
  Future<Result> verifyCode(String code) async {
    return authRepo.verifyOtp(code);
  }
}
