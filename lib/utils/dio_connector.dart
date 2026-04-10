import 'package:dio/dio.dart';

class DioConnector {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "https://codeit.com.np/api/",
      responseType: ResponseType.json, 
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",

      }
    )
  );
}