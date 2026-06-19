import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/model/certificates_model.dart';
import 'package:codeit_app/service/certificates_service.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CertificatesController extends GetxController {
  var certificate = CertificatesModel(sucess: true, data: [],).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCertificates();
  }

  DateTime _parseCompletionDate(String? dateStr) {
    if (dateStr == null || dateStr.trim().isEmpty) {
      return DateTime(1970);
    }
    try {
      return DateFormat('MMM dd, yyyy').parse(dateStr.trim());
    } catch (e) {
      print("Error parsing date: $dateStr, error: $e");
      return DateTime(1970); 
    }
  }

  Future<void> getCertificates() async {
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;

    try {
      isLoading(true);
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await CertificatesService.fetchCertificates();
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final parsedModel = CertificatesModel.fromJson(responseData);
          // ignore: unnecessary_null_comparison
          if (parsedModel.data != null) {
            parsedModel.data.sort((a, b) {
              final DateTime dateA = _parseCompletionDate(a.courseCompletionDate);
              final DateTime dateB = _parseCompletionDate(b.courseCompletionDate);
              return dateB.compareTo(dateA);
            });
          }
          certificate.value = parsedModel;
        } else {
          certificate.value = CertificatesModel(sucess: false, data: []);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      certificate.value = CertificatesModel(sucess: false, data: []);
      errorMessage('Could not load certificates. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
