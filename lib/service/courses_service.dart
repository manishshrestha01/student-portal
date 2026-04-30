import 'package:dio/dio.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:codeit_app/controller/storage_controller.dart';

class CoursesService {
  static Future<Response> fetchCourses() async {
    try {
      var token = StorageController().getToken();
      if (token == null) {
        throw Exception('No token available');
      }
      var response = await DioConnector.dio.get("courses");
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        StorageController().deleteToken();
      }
      rethrow;
    }
  }
}
