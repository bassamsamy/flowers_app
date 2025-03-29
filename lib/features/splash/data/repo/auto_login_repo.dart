import 'package:flowers_app/core/api_manager/api_constants.dart';
import 'package:flowers_app/core/api_manager/api_execute.dart';
import 'package:flowers_app/core/models/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_manager/api_manger.dart';
import '../../../../core/exceptions/exceptions_impl.dart';
import '../../../../core/models/user_model.dart';

@injectable
class AutoLoginRepo {
  const AutoLoginRepo(this._apiManager);

  final ApiManager _apiManager;

  Future<Result> autoLogin() async {
    try {
      const storage = FlutterSecureStorage();
      final String? token = await storage.read(key: 'user_token');

      if (token == null) {
        return Error(CustomException("Auto login failed"));
      }

      ApiExecute.executeApi(
        () async {
          final response = await _apiManager.get(ApiConstants.getUserData);
          UserModel.instance.setFromJson(response.data);
          return response;
        },
      );

      return Success(token);
    } catch (e) {
      return Error(
        CustomException("Auto login failed"),
      );
    }
  }
}
