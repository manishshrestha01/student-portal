import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class SuggestionService {
  static Future<Response> submitSuggestion(String message) async {
    try {
      final token = StorageController().getToken();
      if (token == null) {
        throw Exception('No token available');
      }

      return await DioConnector.dio.post(
        'suggestions',
        data: {'message': message},
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }
}
