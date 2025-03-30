import 'package:flowers_app/core/api_manager/api_execute.dart';
import 'package:flowers_app/core/models/result.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/api_manager/api_constants.dart';
import '../../../../core/api_manager/api_manger.dart';
import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final ApiManager apiManager;

  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result> login(String email, String password) async {
    return ApiExecute.executeApi(
      () async {
        final response = await apiManager.post(
          ApiConstants.loginEndPoint,
          {"email": email, "password": password},
        );

        if (response.statusCode == 200) {
          return Success(null);
        } else {
          return Error(Exception("Something went wrong"));
        }
      },
    );
  }

  @override
  Future<Result> signUp({
    required String email,
    required String password,
    required String gender,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String profileImage,
    required bool isVerified,
    required String role,
    required List<String> wishlist,
    required String id,
    required List<String> addresses,
    required DateTime createdAt,
    required String token,
  }) async {
    return ApiExecute.executeApi(
      () async {
        final response = await apiManager.post(ApiConstants.signUpEndPoint, {
          "email": email,
          "password": password,
          "gender": gender,
          "firstName": firstName,
          "lastName": lastName,
          "phone": phoneNumber,
          "photo": profileImage,
          "isVerified": isVerified,
          "role": role,
          "wishlist": wishlist,
          "_id": id,
          "addresses": addresses,
          "createdAt": createdAt.toIso8601String(),
          "token": token,
        });

        if (response.statusCode == 200) {
          final responseData = response.data;
          return Success(responseData);
        } else {
          return Error(Exception("Something went wrong"));
        }
      },
    );
  }
}