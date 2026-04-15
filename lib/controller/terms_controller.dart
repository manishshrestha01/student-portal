import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/terms_model.dart';
import 'package:codeit_app/service/terms_service.dart';
import 'package:get/get.dart';

class TermsController extends GetxController {
  var terms = TermsModel(sucess: true, data: '').obs;
  var isLoading = false.obs;

  Future<void> getTerms() async {
    try {
      isLoading(true);

      final token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      final response = await TermsService.fetchTerms();
      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          final parsed = TermsModel.fromJson(responseData);
          terms.value = parsed;
        } else if (responseData is String) {
          terms.value = TermsModel(sucess: true, data: responseData);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
