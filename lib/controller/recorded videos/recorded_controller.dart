import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/service/recorded%20videos/recorded_service.dart';
import 'package:get/get.dart';

import '../../model/recorded videos/index_model.dart';

class RecordedController extends GetxController {
  var recordedVideos = <Datum>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getRecordedVideos();
  }

  Future<void> getRecordedVideos() async {
    try {
      isLoading(true);
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await RecordedService.fetchRecordedVideos();
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          recordedVideos.value = List<Datum>.from(responseData['data'].map((x) => Datum.fromJson(x)));
        } else {
          recordedVideos.value = [];
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      recordedVideos.value = [];
      errorMessage('Could not load recorded videos. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
