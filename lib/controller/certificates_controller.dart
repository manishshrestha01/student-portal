import 'package:codeit_app/model/certificates_model.dart';
import 'package:codeit_app/service/certificates_service.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:get/get.dart';

class CertificatesController extends GetxController {
  var certificate = CertificatesModel(sucess: true, data: [], success: true).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getCertificates() async {
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
          certificate.value = CertificatesModel.fromJson(responseData);
        } else {
          certificate.value = CertificatesModel(sucess: false, data: [],success: false,);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      certificate.value = CertificatesModel(sucess: false, data: [],success: false,);
      errorMessage('Could not load certificates. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
