import 'package:codeit_app/model/reset_password_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/forgot_password_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final email = ''.obs;
  final otp = ''.obs;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final resetPasswordResponse =
      ResetPasswordModel(success: null, message: null).obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is Map) {
      final rawEmail = arguments['email'];
      final rawOtp = arguments['otp'];

      if (rawEmail is String) {
        email.value = rawEmail.trim();
      }
      if (rawOtp is String) {
        otp.value = rawOtp.trim();
      }
    }
  }

  Future<void> resetPassword() async {
    final emailValue = email.value.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (emailValue.isEmpty) {
      Get.snackbar(
        'Error',
        'Email is missing. Please start from forgot password again.',
      );
      Get.offAllNamed(AppRoutes.forgotPassword);
      return;
    }

    if (password.isEmpty) {
      Get.snackbar('Error', 'Please enter new password.');
      return;
    }
    if (confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please confirm your password.');
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match.');
      return;
    }

    try {
      isLoading(true);
      final response = await ForgotPasswordService.resetPassword(
        email: emailValue,
        password: password,
        otp: otp.value.trim(),
        passwordConfirmation: confirmPassword,
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        resetPasswordResponse.value = ResetPasswordModel(
          success: _parseSuccess(data),
          message: _extractMessage(data),
        );

        if (resetPasswordResponse.value.success == true) {
          Get.snackbar(
            'Success',
            resetPasswordResponse.value.message ??
                'Password changed successfully. Please login.',
          );
          passwordController.clear();
          confirmPasswordController.clear();
          Get.offAllNamed(AppRoutes.login);
        } else {
          Get.snackbar(
            'Error',
            resetPasswordResponse.value.message ?? 'Failed to reset password.',
          );
        }
      } else {
        Get.snackbar('Error', 'Unexpected response from server.');
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        Get.snackbar('Error', _extractMessage(data) ?? 'Failed to reset password.');
      } else {
        Get.snackbar('Error', 'Could not reset password. Please try again.');
      }
    } catch (_) {
      Get.snackbar('Error', 'Could not reset password. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  bool _parseSuccess(Map<String, dynamic> data) {
    final raw = data['success'];
    if (raw is bool) return raw;
    if (raw is int) return raw == 1;
    if (raw is String) return raw.toLowerCase() == 'true' || raw == '1';
    return false;
  }

  String? _extractMessage(Map<String, dynamic> data) {
    final rawMessage = data['message'];
    if (rawMessage is String && rawMessage.isNotEmpty) {
      return rawMessage;
    }

    final rawErrors = data['errors'] ?? rawMessage;
    if (rawErrors is Map<String, dynamic>) {
      for (final value in rawErrors.values) {
        if (value is List && value.isNotEmpty) {
          return value.first.toString();
        }
        if (value is String && value.isNotEmpty) {
          return value;
        }
      }
    }

    return null;
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
