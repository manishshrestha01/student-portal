import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class SupportService {
  static Future<Response> submitTicket({
    required String category,
    required String subject,
    required String message,
  }) async {
    try {
      final token = StorageController().getToken();
      if (token == null) {
        throw Exception('No token available');
      }

      return await DioConnector.dio.post(
        'support-ticket',
        data: {'category': category, 'subject': subject, 'message': message},
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }
}
