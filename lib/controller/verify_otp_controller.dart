import 'package:codeit_app/controller/forgot_password_controller.dart';
import 'package:codeit_app/model/verify_otp_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/forgot_password_service.dart';
import 'package:codeit_app/service/verify_otp_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  static const int otpLength = 6;

  var verifyOtpResponse = VerifyOtpModel(success: false, message: null).obs;
  var isLoading = false.obs;
  var isResending = false.obs;
  var email = ''.obs;

  final List<TextEditingController> otpControllers = List.generate(
    otpLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(
    otpLength,
    (_) => FocusNode(),
  );

  String get otpCode =>
      otpControllers.map((controller) => controller.text).join();

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    if (arguments is Map && arguments['email'] is String) {
      email.value = (arguments['email'] as String).trim();
      return;
    }

    if (Get.isRegistered<ForgotPasswordController>()) {
      email.value = Get.find<ForgotPasswordController>().emailController.text
          .trim();
    }
  }

  void onOtpChanged(int index, String value) {
    if (value.length == 1 && index < otpFocusNodes.length - 1) {
      otpFocusNodes[index + 1].requestFocus();
      return;
    }

    if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpCode.trim();
    final emailValue = email.value.trim();

    if (emailValue.isEmpty) {
      Get.snackbar(
        'Error',
        'Email is missing. Please try forgot password again.',
      );
      Get.offNamed(AppRoutes.forgotPassword);
      return;
    }

    if (otp.isEmpty) {
      Get.snackbar('Error', 'Please enter OTP.');
      return;
    }

    if (otp.length != otpLength) {
      Get.snackbar('Error', 'OTP must be $otpLength digits.');
      return;
    }

    try {
      isLoading(true);
      final response = await VerifyOtpService.verifyOtp(
        email: emailValue,
        otp: otp,
      );
      final data = response.data;

      if (data is Map<String, dynamic>) {
        verifyOtpResponse.value = VerifyOtpModel.fromJson(data);
        if (verifyOtpResponse.value.success == true) {
          Get.snackbar(
            'Success',
            verifyOtpResponse.value.message ?? 'OTP verified successfully.',
          );
          Get.toNamed(
            AppRoutes.changePassword,
            arguments: {'email': emailValue, 'otp': otp},
          );
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
        Get.snackbar('Error', 'Could not verify OTP. Please try again.');
      }
    } catch (_) {
      Get.snackbar('Error', 'Could not verify OTP. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  Future<void> resendOtp() async {
    final emailValue = email.value.trim();
    if (emailValue.isEmpty) {
      Get.snackbar(
        'Error',
        'Email is missing. Please try forgot password again.',
      );
      Get.offNamed(AppRoutes.forgotPassword);
      return;
    }

    try {
      isResending(true);
      final response = await ForgotPasswordService.sendOtp(emailValue);
      final data = response.data;

      if (data is Map<String, dynamic>) {
        if (data['success'] == true) {
          for (final controller in otpControllers) {
            controller.clear();
          }
          otpFocusNodes.first.requestFocus();

          final message = data['message'];
          Get.snackbar(
            'Success',
            message is String && message.isNotEmpty
                ? message
                : 'OTP sent to your email.',
          );
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
      isResending(false);
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

    return 'Something went wrong. Please try again.';
  }

  @override
  void onClose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }
    for (final focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}
