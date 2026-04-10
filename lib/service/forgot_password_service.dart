import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class ForgotPasswordService {
  static Future<Response> sendOtp(String email) async {
    return DioConnector.dio.post('forgot-password', data: {'email': email});
  }

  static Future<Response> resetPassword({
    required String email,
    required String password,
    String? otp,
    String? passwordConfirmation,
  }) async {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    if (otp != null && otp.isNotEmpty) {
      data['otp'] = otp;
    }
    if (passwordConfirmation != null && passwordConfirmation.isNotEmpty) {
      data['password_confirmation'] = passwordConfirmation;
    }

    return DioConnector.dio.post('reset-password', data: data);
  }
}
