import 'package:codeit_app/model/forgot_password_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/forgot_password_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var forgotPasswordResponse = ForgotPasswordModel(
    success: false,
    message: null,
  ).obs;
  var isLoading = false.obs;

  final TextEditingController emailController = TextEditingController();

  Future<void> sendOtp() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email address.');
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email address.');
      return;
    }

    try {
      isLoading(true);
      final response = await ForgotPasswordService.sendOtp(email);
      final data = response.data;

      if (data is Map<String, dynamic>) {
        forgotPasswordResponse.value = ForgotPasswordModel.fromJson(data);

        if (forgotPasswordResponse.value.success == true) {
          Get.snackbar(
            'Success',
            forgotPasswordResponse.value.message ?? 'OTP sent to your email.',
          );
          Get.toNamed(AppRoutes.verifyOtp, arguments: {'email': email});
        } else {
          Get.snackbar('Error', _extractErrorMessage(data));
        }
      } else {
        Get.snackbar('Error', 'Unexpected response from server.');
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        Get.snackbar('Error', _extractErrorMessage(data));
      } else {
        Get.snackbar('Error', 'Could not send OTP. Please try again.');
      }
    } catch (_) {
      Get.snackbar('Error', 'Could not send OTP. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  String _extractErrorMessage(Map<String, dynamic> data) {
    final errors = data['errors'] ?? data['message'];

    if (errors is Map<String, dynamic>) {
      for (final value in errors.values) {
        if (value is List && value.isNotEmpty) {
          return value.first.toString();
        }
        if (value is String && value.isNotEmpty) {
          return value;
        }
      }
    }

    final message = data['message'];
    if (message is String && message.isNotEmpty) {
      return message;
    }

    return 'Could not send OTP. Please try again.';
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
