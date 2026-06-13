import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/model/suggestion_model.dart';
import 'package:codeit_app/service/suggestion_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionController extends GetxController {
  var suggestionResponse = SuggestionModel(success: false, message: null).obs;
  var isLoading = false.obs;

  final TextEditingController messageController = TextEditingController();

  Future<void> submitSuggestion() async {
    final message = messageController.text.trim();

    if (message.isEmpty) {
      Get.snackbar('Error', 'Please enter your suggestion.');
      return;
    }

    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;

    try {
      isLoading(true);
      final response = await SuggestionService.submitSuggestion(message);

      final data = response.data;
      if (data is Map<String, dynamic>) {
        if (data['success'] == true) {
          suggestionResponse.value = SuggestionModel.fromJson(data);
          Get.snackbar(
            'Success',
            suggestionResponse.value.message ??
                'Suggestion submitted successfully.',
          );
          messageController.clear();
        } else {
          Get.snackbar('Error', _extractErrorMessage(data));
        }
      } else {
        Get.snackbar('Error', 'Unexpected response from server.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not submit suggestion. Please try again.');
    } finally {
      isLoading(false);
    }
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

    return 'Could not submit suggestion. Please try again.';
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
