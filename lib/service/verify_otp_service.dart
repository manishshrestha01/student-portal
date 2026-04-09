import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class VerifyOtpService {
  static Future<Response> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return DioConnector.dio.post(
      'verify-otp',
      data: {'email': email, 'otp': otp},
    );
  }
}
