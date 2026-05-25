import 'package:codeit_app/controller/storage_controller.dart';
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
      },
    );
    return response;
  }

  static Future<Response> login(String email, String password) async {
    var response = await DioConnector.dio.post(
      "login",
      data: {"email": email, "password": password},
    );
    return response;
  }


  static Future<Response> getUser() async {
      final token = StorageController().getToken();
   return DioConnector.dio.get(
    "profile",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}

static Future<Response> updateProfile(
  String name, 
  String email, 
  String whatsapp, 
  String address,
  String countryCode,
  ) async {
  final token = StorageController().getToken();
  final response = await DioConnector.dio.post(
    "update-profile",
    data: {
      "name": name,
      "email": email,
      "phone": whatsapp,
      "address": address,
      "country_code": countryCode,
    },
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
  return response;
}

static Future<Response> resetPassword(String email, String newPassword) async{
final token = StorageController().getToken();
final response = await DioConnector.dio.post("reset-password",
data: {
"email": email,
"password": newPassword,
},
options: Options(
  headers: {
    "Authorization": "Bearer $token",
  }
)
);
return response;
}

}

