import 'package:dio/dio.dart';
import 'package:codeit_app/utils/dio_connector.dart';

class AuthService {
  static Future<Response> register(
    String name,
    String email,
    String whatsapp,
    String password,
    String countryCode,
  ) async {
    var response = await DioConnector.dio.post(
      "register",
      data: {
        "name": name,
        "email": email,
        "whatsapp": whatsapp,
        "password": password,
        "country_code": countryCode,
      }
    );
    return response;
  }

  static Future<Response> login(String email, String password) async {
    var response = await DioConnector.dio.post("login",
    data:{
      "email": email,
      "password": password,
    },
    );
    return response;
  }
}
