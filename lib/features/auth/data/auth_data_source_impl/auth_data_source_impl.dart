import 'package:flowers_app/core/api_manager/api_execute.dart';
import 'package:flowers_app/core/models/result.dart';

import 'package:flowers_app/core/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_manager/api_constants.dart';
import '../../../../core/api_manager/api_manger.dart';
import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final ApiManager apiManager;

  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result<UserModel>> login(String email, String password) async {
    return  ApiExecute.executeApi(
      () async {
        final response = await apiManager.post(
            ApiConstants.loginEndPoint, {"email": email, "password": password});

        return UserModel.fromJson(response.data);
      },
    );
  }
}
