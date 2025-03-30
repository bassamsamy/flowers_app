import 'package:flowers_app/core/api_manager/api_execute.dart';
import 'package:flowers_app/core/api_manager/api_manger.dart';
import 'package:flowers_app/core/models/result.dart';
import 'package:injectable/injectable.dart';

import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl({required this.apiManager});
  ApiManager apiManager;
  @override
  Future<Result> forgetPassword(String email) {
    return ApiExecute.executeApi(
      () async {
        var response =
            await apiManager.post('auth/forgotPassword', {"email": email});
        return response;
      },
    );
  }

  @override
  Future<Result> verifyOtp(String code) {
    return ApiExecute.executeApi(
      () async {
        var response =
            await apiManager.post('auth/verifyResetCode', {"resetCode": code});
        return response;
      },
    );
  }

  @override
  Future<Result> resetPassword(String email, String newPassword) {
    return ApiExecute.executeApi(
      () async {
        var response = await apiManager.put(
            'auth/resetPassword', {"email": email, "newPassword": newPassword});
        return response;
      },
    );
  }
}
