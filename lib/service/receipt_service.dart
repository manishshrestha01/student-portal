import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class ReceiptService {
  static Future<ReceiptModel?> fetchReceipts() async {
    try {
      final token = StorageController().getToken();
      if (token == null) {
        print('Token is null');
        throw Exception('No token available');
      }

      final response = await DioConnector.dio.get(
        'show-receipt',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      return ReceiptModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}