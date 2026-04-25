import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/login_model.dart';
import 'package:codeit_app/model/register_model.dart';
import 'package:codeit_app/model/reset_password_model.dart';
import 'package:codeit_app/model/update_profile_model.dart';
import 'package:codeit_app/model/user_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/auth_service.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;
  final registerMessage = RegisterModel(success: null, errors: null).obs;
  final isLoading = false.obs;
  final loginMessage = LoginModel(success: null, token: null, message: null).obs;
  final updateProfileMessage =
      UpdateProfileModel(success: null, message: null).obs;
  final resetPasswordMessage =
      ResetPasswordModel(success: null, message: null).obs;
  final user = Rxn<User>();

  final rememberMe = false.obs;

  // For password toggle.
  final isPasswordHidden = true.obs;
  final currentPasswordHidden = true.obs;
  final newPasswordHidden = true.obs;
  final confirmPasswordHidden = true.obs;

  // Text editing controllers.
  final name = TextEditingController();
  final email = TextEditingController();
  final whatsapp = TextEditingController();
  final password = TextEditingController();
  final countryCode = TextEditingController();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  void clearForm() {
    name.clear();
    email.clear();
    whatsapp.clear();
    password.clear();
    countryCode.clear();
  }

  void clearPasswordForm() {
    currentPassword.clear();
    newPassword.clear();
    confirmPassword.clear();
  }

  // Check auth splash screen.
  void checkAuth() {
    final token = StorageController().getToken();
    if (token != null) {
      fetchUser();
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.home);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.login);
      });
    }
  }

  // Register user.
  Future<void> register() async {
    try {
      isLoading(true);
      final response = await AuthService.register(
        name.text,
        email.text,
        whatsapp.text,
        password.text,
        countryCode.text,
      );
      if (response.statusCode == 200) {
        registerMessage.value = RegisterModel.fromJson(response.data);
        if (registerMessage.value.success == true) {
          Get.snackbar("Success", "Registration successful");
          clearForm();
          Get.toNamed(AppRoutes.login);
        } else {
          Get.snackbar(
            "Error",
            registerMessage.value.errors?.email.isNotEmpty == true
                ? registerMessage.value.errors!.email[0]
                : "Registration failed",
          );
        }
      } else {
        registerMessage.value = RegisterModel.fromJson(response.data);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    } finally {
      isLoading(false);
    }
  }

  // Login user.
  Future<void> login() async {
    try {
      isLoading(true);

      final response = await AuthService.login(email.text, password.text);

        loginMessage.value = LoginModel.fromJson(response.data);

      if (response.statusCode == 200 && loginMessage.value.success == true) {

          StorageController().saveToken(loginMessage.value.token!);
          await fetchUser();
          Get.offNamed(AppRoutes.home);
      
      } else {
        Get.snackbar(
          "Login Failed",
          loginMessage.value.message ?? "Invalid email or password",
          backgroundColor: AppColors.primary,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }

    } catch (e) {
      Get.snackbar("Error", loginMessage.value.message ?? "Login failed");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchUser() async {
    try {
      final response = await AuthService.getUser();
      if (response.statusCode == 200) {
        final userResponse = UserModel.fromJson(response.data);
        user.value = userResponse.user;
        if (user.value != null) {
          StorageController().saveUser({
            "id": user.value!.id,
            "name": user.value!.name,
            "email": user.value!.email,
            "phone": user.value!.phone,
            "address": user.value!.countryCode,
          });
        }
      }
    } catch (_) {
      final cachedUser = StorageController().getUser();
      if (cachedUser != null) {
        user.value = User.fromJson(cachedUser);
      }
    }
  }

  Future<void> updateProfile() async {
    try {
      isLoading(true);
      final response = await AuthService.updateProfile(
        name.text,
        email.text,
        whatsapp.text,
        countryCode.text,
      );

      if (response.statusCode == 200) {
        updateProfileMessage.value = UpdateProfileModel.fromJson(response.data);
        if (updateProfileMessage.value.success == true) {
          user.value = User(
            id: user.value?.id,
            name: name.text,
            email: email.text,
            phone: whatsapp.text,
            countryCode: countryCode.text,
          );
          StorageController().saveUser({
            "id": user.value?.id,
            "name": user.value?.name,
            "email": user.value?.email,
            "phone": user.value?.phone,
            "address": user.value?.countryCode,
          });
          Get.snackbar(
            "Success",
            updateProfileMessage.value.message ?? "Profile updated successfully",
          );
        } else {
          Get.snackbar(
            "Error",
            updateProfileMessage.value.message ?? "Failed to update profile",
          );
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile");
    } finally {
      isLoading(false);
    }
  }

  Future<void> resetPassword() async {
    if (newPassword.text != confirmPassword.text) {
      Get.snackbar("Error", "New password and confirm password must match");
      return;
    }

    try {
      isLoading(true);
      final response = await AuthService.resetPassword(
        currentPassword.text,
        newPassword.text,
        confirmPassword.text,
      );

      if (response.statusCode == 200) {
        resetPasswordMessage.value = ResetPasswordModel.fromJson(response.data);
        if (resetPasswordMessage.value.success == true) {
          clearPasswordForm();
          Get.snackbar(
            "Success",
            resetPasswordMessage.value.message ?? "Password updated successfully",
          );
        } else {
          Get.snackbar(
            "Error",
            resetPasswordMessage.value.message ?? "Failed to update password",
          );
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update password");
    } finally {
      isLoading(false);
    }
  }

//logout
  void logout() {
    StorageController().deleteToken();
    user.value = null;
    DioConnector.dio.options.headers.remove('Authorization');
    Get.offAllNamed(AppRoutes.login);
  }

  void logOut() {
    logout();
  }

  @override
  void onInit() {
    super.onInit();
    clearForm();
    checkAuth();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    whatsapp.dispose();
    password.dispose();
    countryCode.dispose();
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
