import 'package:dio/dio.dart';
import 'package:flowers_app/core/models/user_model.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';

@injectable
@singleton
class ApiManager {
  final Dio _dio;

  ApiManager(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.sendTimeout = const Duration(seconds: 10);
    _dio.options.followRedirects = false;
    _dio.options.headers = {"token": UserModel.instance.token};
  }

  Future<Response> post(String endPoint, dynamic data,
      {dynamic headers}) async {
    return await _dio.post(
      endPoint,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response> get(String endPoint, {dynamic headers}) async {
    return await _dio.get(endPoint, options: Options(headers: headers));
  }

  Future<Response> delete(String endPoint,
      {dynamic headers, dynamic body}) async {
    return await _dio.delete(endPoint,
        options: Options(headers: headers), data: body);
  }

  Future<Response> patch(String endPoint,
      {dynamic data, dynamic headers}) async {
    return await _dio.patch(
      endPoint,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }
}
