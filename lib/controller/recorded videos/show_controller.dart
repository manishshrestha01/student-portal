import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/model/recorded%20videos/show_model.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/service/recorded%20videos/show_service.dart';
import 'package:get/get.dart';

class ShowController extends GetxController {
  var showrecordedvideos = Rxn<ShowModel>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  String? _activeSlug;

  Future<void> getRecordedVideos(String slug) async {
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;

    final requestedSlug = slug.trim();
    if (requestedSlug.isEmpty) {
      showrecordedvideos.value = null;
      errorMessage('Invalid recorded course slug.');
      return;
    }
    _activeSlug = requestedSlug;
    showrecordedvideos.value = null;
    try {
      isLoading(true);
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await ShowService.showRecordedVideos(requestedSlug);
      if (response.statusCode == 200) {
        if (_activeSlug != requestedSlug) return;
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          showrecordedvideos.value = ShowModel.fromJson(responseData);
        } else {
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      if (_activeSlug == requestedSlug) {
        errorMessage('Could not load recorded courses. Please try again.');
      }
    } finally {
      if (_activeSlug == requestedSlug) {
        isLoading(false);
      }
    }
  }
}
