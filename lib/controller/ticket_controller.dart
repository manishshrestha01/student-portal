import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/model/ticket_model.dart';
import 'package:codeit_app/service/ticket_service.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  var ticket = TicketModel(success: true, data: []).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getTickets() async {
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

      var response = await TicketService.fetchTickets();
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          ticket.value = TicketModel.fromJson(responseData);
        } else {
          ticket.value = TicketModel(success: false, data: []);
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      ticket.value = TicketModel(success: false, data: []);
      errorMessage('Could not load tickets. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
