import 'package:dio/dio.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:codeit_app/controller/storage_controller.dart';

class StoreService {
  static Future<Response> fetchStore(dynamic id) async {
    try {
      var token = StorageController().getToken();
      if (token == null) {
        throw Exception('No token available');
      }
      var response = await DioConnector.dio.get("videos/$id");
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }

  static Future<Response> submitStore(
    dynamic id,
    String plan,
    String filePath,
    bool terms,
  ) async {
    try {
      var token = StorageController().getToken();
      if (token == null) {
        throw Exception('No token available');
      }

      final formData = FormData.fromMap({
        'payment': await MultipartFile.fromFile(filePath),
        'plan': plan,
        'terms': terms ? '1' : '0',
      });

      var response = await DioConnector.dio.post(
        "videos/$id",
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }
}

