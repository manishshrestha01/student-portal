import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class ForgotPasswordService {
  static Future<Response> sendOtp(String email) async {
    return DioConnector.dio.post('forgot-password', data: {'email': email});
  }
}
