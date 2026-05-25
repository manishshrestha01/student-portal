import 'package:codeit_app/model/upcoming%20course/upcoming_model.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/service/upcoming%20course/upcoming_service.dart';
import 'package:get/get.dart';

class UpcomingController extends GetxController {
  var upcomingclass = UpcomingModel(sucess: true, data: [],).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUpcomingClasses();
  }

  Future<void> getUpcomingClasses() async {
    try {
      isLoading(true);
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await UpcomingService.fetchUpcomingClasses();
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          upcomingclass.value = UpcomingModel.fromJson(responseData);
        } else {
          upcomingclass.value = UpcomingModel(sucess: false, data: []);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      upcomingclass.value = UpcomingModel(sucess: false, data: []);
      errorMessage('Could not load upcoming classes. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
