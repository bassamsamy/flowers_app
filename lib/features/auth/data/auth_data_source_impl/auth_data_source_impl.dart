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
  final ApiManager apiManager;

  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result> login(String email, String password, bool rememberMe) async {
    return ApiExecute.executeApi(
      () async {
        final response = await apiManager.post(
            ApiConstants.loginEndPoint, {"email": email, "password": password});

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
}
