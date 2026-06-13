import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/model/link_model.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/service/link_service.dart';
import 'package:get/get.dart';

class LinkController extends GetxController {
  var link = LinkModel(success: true, data: [],).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getLinks() async {
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

      var response = await LinkService.fetchLink();
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          link.value = LinkModel.fromJson(responseData);
        } else {
          link.value = LinkModel(success: false, data: []);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      link.value = LinkModel(success: false, data: []);
      errorMessage('Could not load link. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
