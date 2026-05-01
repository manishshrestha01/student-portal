
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/courses_model.dart';
import 'package:codeit_app/service/courses_service.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  var courses = CoursesModel(success: true, data: [],).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCourses();
  }

  Future<void> getCourses() async {
    try {
      isLoading(true);
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await CoursesService.fetchCourses();
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          courses.value = CoursesModel.fromJson(responseData);
        } else {
          courses.value = CoursesModel(success: false, data: []);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      courses.value = CoursesModel(success: false, data: []);
      errorMessage('Could not load courses. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
