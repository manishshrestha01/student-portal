import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/notes_model.dart';
import 'package:codeit_app/service/notes_service.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  var note = NotesModel(sucess: true, notes: []).obs;
  var loadingIds = <String, bool>{}.obs;
  var errorMessage = ''.obs;

  bool isLoadingForId(String id) {
    return loadingIds[id] ?? false;
  }

  Future<void> sendNote(dynamic id) async {
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

      var response = await NotesService.fetchNotes(id);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          note.value = NotesModel.fromJson(responseData);
          print("SERVER MESSAGE: ${note.value.notes}");
        } else {
          note.value = NotesModel(sucess: false, notes: []);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      note.value = NotesModel(sucess: false, notes: []);
      errorMessage('Could not load notes. Please try again.');
    } finally {
      loadingIds[idString] = false;
      loadingIds.refresh();
    }
  }
}
