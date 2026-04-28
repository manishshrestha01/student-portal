import 'package:codeit_app/model/email_certificate_model.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/service/email_certificates_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailCertificatesController extends GetxController {
  var emailcertificate = EmailCertificatesModel(success: true, message: '' ).obs;
  var loadingIds = <String, bool>{}.obs;
  var errorMessage = ''.obs;

  bool isLoadingForId(String id) {
    return loadingIds[id] ?? false;
  }

  Future<void> sendEmail(dynamic id) async {
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

      var response = await EmailCertificatesService.fetchEmailCertificates(id);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          emailcertificate.value = EmailCertificatesModel.fromJson(responseData);
          Get.snackbar(
            emailcertificate.value.success == true ? "Success" : "Error",
            emailcertificate.value.message ?? "Something went wrong",
            backgroundColor: emailcertificate.value.success == true ? Colors.green : Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          print("SERVER MESSAGE: ${emailcertificate.value.message}");
        } else {
          emailcertificate.value = EmailCertificatesModel(success: false, message: '');
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      emailcertificate.value = EmailCertificatesModel(success: false, message: '');
      errorMessage('Could not load certificates. Please try again.');
    } finally {
      loadingIds[idString] = false;
      loadingIds.refresh();
    }
  }
}
