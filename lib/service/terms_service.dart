import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class TermsService {
  static Future<Response> fetchTerms() async {
    try {
      return await DioConnector.dio.get('terms');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }
}
