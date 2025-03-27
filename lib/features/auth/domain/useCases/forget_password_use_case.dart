import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordUseCase {
  ForgetPasswordUseCase({required this.forgetPasswordRepo});
  ForgetPasswordRepository forgetPasswordRepo;
  Future<Result> forgetPassword(String email) async {
    return forgetPasswordRepo.forgetPassword(email);
  }
}