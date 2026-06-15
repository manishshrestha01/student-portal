import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/model/support_ticket.dart';
import 'package:codeit_app/service/support_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  var supportResponse = SupportTicketModel(success: false, message: null).obs;
  var isLoading = false.obs;

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> submitTicket(String categoryLabel) async {
    final String subject = subjectController.text.trim();
    final String message = messageController.text.trim();
    final String category = _mapCategory(categoryLabel);

    if (subject.isEmpty) {
      Get.snackbar('Error', 'Please enter subject.', backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (subject.length < 5) {
      Get.snackbar('Error', 'Subject must be at least 5 characters.', backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (message.isEmpty) {
      Get.snackbar('Error', 'Please enter message.', backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;

    try {
      isLoading(true);
      final response = await SupportService.submitTicket(
        category: category,
        subject: subject,
        message: message,
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        if (data['success'] == true) {
          supportResponse.value = SupportTicketModel.fromJson(data);
          Get.snackbar(
            'Success',
            supportResponse.value.message ?? 'Your ticket has been sent.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          clearFields();
        } else {
          Get.snackbar('Error', _extractErrorMessage(data), backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        Get.snackbar('Error', 'Unexpected response from server.', backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not submit ticket. Please try again.', backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  void clearFields() {
    subjectController.clear();
    messageController.clear();
  }

  String _mapCategory(String value) {
    final text = value.toLowerCase().trim();

    if (text.contains('technical')) {
      return 'technical';
    }
    if (text.contains('counselling')) {
      return 'counselling';
    }
    if (text.contains('internship')) {
      return 'internship';
    }
    return 'general';
  }

  String _extractErrorMessage(Map<String, dynamic> data) {
    final errors = data['errors'];
    if (errors is Map<String, dynamic>) {
      for (final entry in errors.values) {
        if (entry is List && entry.isNotEmpty) {
          return entry.first.toString();
        }
        if (entry is String && entry.isNotEmpty) {
          return entry;
        }
      }
    }

    final message = data['message'];
    if (message is String && message.isNotEmpty) {
      return message;
    }

    return 'Could not submit ticket. Please try again.';
  }

  @override
  void onClose() {
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
