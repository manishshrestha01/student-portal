import 'package:dio/dio.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:codeit_app/controller/storage_controller.dart';

class CertificatesService {
  static Future<Response> fetchCertificates() async {
    try {
      var token = StorageController().getToken();
      if (token == null) {
        throw Exception('No token available');
      }
      var response = await DioConnector.dio.get("certificates");
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }
}
