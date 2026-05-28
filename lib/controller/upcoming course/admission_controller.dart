import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/upcoming%20course/admission_model.dart';
import 'package:codeit_app/service/upcoming%20course/admission_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmissionController extends GetxController {
  var submitadmission = AdmissionModel(success: true, message: '' ).obs;
  var loadingIds = <String, bool>{}.obs;
  var errorMessage = ''.obs;

  bool isLoadingForId(String id) {
    return loadingIds[id] ?? false;
  }

  Future<void> sendAdmission(dynamic id) async {
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

      var response = await AdmissionService.fetchAdmission(id);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          submitadmission.value = AdmissionModel.fromJson(responseData);
          Get.snackbar(
            submitadmission.value.success == true ? "Success" : "Error",
            submitadmission.value.message ?? "Something went wrong",
            backgroundColor: submitadmission.value.success == true ? Colors.green : Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          print("SERVER MESSAGE: ${submitadmission.value.message}");
        } else {
          submitadmission.value = AdmissionModel(success: false, message: '');
          errorMessage('Unexpected response format from server.');
        }
      }
    } catch (e) {
      submitadmission.value = AdmissionModel(success: false, message: '');
      errorMessage('Could not load admission. Please try again.');
    } finally {
      loadingIds[idString] = false;
      loadingIds.refresh();
    }
  }

  Future<void> submitAdmissionWithPayment(dynamic id, String filePath, bool terms) async {
    final idString = id.toString();
    print("DEBUG: Submitting admission with payment for ID -> $idString");
    print("DEBUG: File path -> $filePath");
    print("DEBUG: Terms agreed -> $terms");
    try {
      loadingIds[idString] = true;
      loadingIds.refresh();
      errorMessage('');
      var token = StorageController().getToken();
      if (token == null) {
        Get.offAllNamed('/login');
        return;
      }

      var response = await AdmissionService.submitAdmission(id, filePath, terms);
      print("DEBUG: Response status code -> ${response.statusCode}");
      print("DEBUG: Response data -> ${response.data}");
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          submitadmission.value = AdmissionModel.fromJson(responseData);
          
          // Check if success is true from backend
          if (submitadmission.value.success == true) {
            Get.snackbar(
              "Success",
              submitadmission.value.message ?? "Admission submitted successfully",
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
            );
          } else {
            // Backend returned success status code but success flag is false
            Get.snackbar(
              "Error",
              submitadmission.value.message ?? "Failed to submit admission",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
            );
          }
          print("SERVER MESSAGE: ${submitadmission.value.message}");
        } else {
          submitadmission.value = AdmissionModel(success: false, message: '');
          errorMessage('Unexpected response format from server.');
        }
      } else {
        submitadmission.value = AdmissionModel(success: false, message: 'Server error');
        Get.snackbar(
          "Error",
          "Server error: ${response.statusCode}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      submitadmission.value = AdmissionModel(success: false, message: '');
      errorMessage('Could not submit admission. Please try again.');
      Get.snackbar(
        "Error",
        "Failed to submit admission: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      loadingIds[idString] = false;
      loadingIds.refresh();
    }
  }
}
