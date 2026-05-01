import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/video_player_model.dart';
import 'package:codeit_app/service/video_player_service.dart';
import 'package:get/get.dart';

class VideoPlayerController extends GetxController {
  var videoplayer = VideoPlayerModel(success: true, video: null).obs;
  var loadingIds = <String, bool>{}.obs;
  var errorMessage = ''.obs;

  bool isLoadingForId(String id) {
    return loadingIds[id] ?? false;
  }

  Future<void> sendVideo(dynamic id) async {
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

      var response = await VideoPlayerService.fetchVideoPlayer(id);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          videoplayer.value = VideoPlayerModel.fromJson(responseData);
          print("SERVER MESSAGE: ${videoplayer.value.video}");
        } else {
          videoplayer.value = VideoPlayerModel(success: false, video: null);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      videoplayer.value = VideoPlayerModel(success: false, video: null);
      errorMessage('Could not load videos. Please try again.');
    } finally {
      loadingIds[idString] = false;
      loadingIds.refresh();
    }
  }
}
