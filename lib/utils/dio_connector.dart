import 'package:dio/dio.dart';
import 'package:codeit_app/controller/storage_controller.dart';

class DioConnector {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "https://codeit.com.np/api/",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      }
    )
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        var token = StorageController().getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          StorageController().deleteToken();
        }
        return handler.next(error);
      },
    )
  );
}