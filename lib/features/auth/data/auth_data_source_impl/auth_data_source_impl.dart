import 'package:flowers_app/core/api_manager/api_execute.dart';
import 'package:flowers_app/core/models/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api_manager/api_constants.dart';
import '../../../../core/api_manager/api_manger.dart';
import '../../../../core/models/user_model.dart';
import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl({required this.apiManager});

  ApiManager apiManager;

  @override
  Future<Result> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String phone,
    String userName,
    String gender,
    String rePassword,
  ) {
    return ApiExecute.executeApi(() async {
      final response = await apiManager.post('auth/signUp', {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "rePassword": rePassword,
        "password": password,
        "phone": phone,
        "userName": userName,
        "gender": gender,
      });

      if (response.statusCode == 200) {
        return Success(response.data);
      } else {
        return Error(Exception("Sign up failed"));
      }
    });
  }

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

  @override
  Future<Result> login(String email, String password, bool rememberMe) async {
    return ApiExecute.executeApi(
      () async {
        final response = await apiManager.post(
            ApiConstants.loginEndPoint, {"email": email, "password": password});
        UserModel.instance.setFromJson(response.data);
        if (response.statusCode == 200) {
          const storage = FlutterSecureStorage();
          if (rememberMe) {
            await storage.write(
                key: 'user_token', value: UserModel.instance.token);
          }
          return Success(null);
        } else {
          return Error(Exception("Something went wrong"));
        }
      },
    );
  }

  @override
  Future<Result<Result>> gatCategory(String name, String image, String id) {
    return ApiExecute.executeApi(
      () async {
        var responses = await apiManager.get('category/$id');
        if (responses.statusCode != 200) {
          return Error(Exception("Something went wrong"));
        }
        if (responses.data == null) {
          return Error(Exception("Something went wrong"));
        }

        if (responses.data['data'] == null) {
          return Error(Exception("Something went wrong"));
        }
        if (responses.data['data']['category'] == null) {
          return Error(Exception("Something went wrong"));
        }
        if (responses.data['data']['category']['products'] == null) {
          return Error(Exception("Something went wrong"));
        }

        if (responses.data['data']['category']['products'].length == 0) {
          return Error(Exception("Something went wrong"));
        }
        return Success(responses.data);
      },
    );
  }
}
