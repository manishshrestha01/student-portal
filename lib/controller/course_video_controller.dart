import 'package:codeit_app/model/course_video_model.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/service/course_video_services.dart';
import 'package:get/get.dart';

class CourseVideoController extends GetxController {
  var coursevideo = CourseVideoModel(success: true, courseDetails: null).obs;
  var loadingIds = <String, bool>{}.obs;
  var errorMessage = ''.obs;

  bool isLoadingForId(String id) {
    return loadingIds[id] ?? false;
  }

  Future<void> sendCourseVideo(dynamic id) async {
    final idString = id.toString();
    print("DEBUG: Sending ID to server -> $idString");
    try {
      loadingIds[idString] = true;
      loadingIds.refresh();
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await CourseVideoServices.fetchCourseVideos(id);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          coursevideo.value = CourseVideoModel.fromJson(responseData);
          print("Course: ${coursevideo.value.courseDetails?.course?.name}");
        } else {
          coursevideo.value = CourseVideoModel(success: false, courseDetails: null);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      coursevideo.value = CourseVideoModel(success: false, courseDetails: null);
      errorMessage('Could not load video. Please try again.');
    } finally {
      loadingIds[idString] = false;
      loadingIds.refresh();
    }
  }
}
