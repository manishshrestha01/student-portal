import 'package:codeit_app/controller/network_controller.dart';
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
  late final StorageController _storage;

  StorageController get storageController => _storage;

  @override
  void onInit() {
    super.onInit();
    _storage = Get.find<StorageController>();
    clearForm();
    _restoreRememberedEmail();
    checkAuth();
  }

  final isLoggedIn = false.obs;
  final registerMessage = RegisterModel(success: null, errors: null).obs;
  final isLoading = false.obs;
  final loginMessage = LoginModel(
    success: null,
    token: null,
    message: null,
  ).obs;
  final updateProfileMessage = UpdateProfileModel(
    success: null,
    message: null,
  ).obs;
  final resetPasswordMessage = ResetPasswordModel(
    success: null,
    message: null,
  ).obs;
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
  final countryCode = TextEditingController(text: '+977');
  final address = TextEditingController();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  void _restoreRememberedEmail() {
    final rememberedEmail = _storage.getRememberedEmail();
    if (rememberedEmail != null && rememberedEmail.isNotEmpty) {
      email.text = rememberedEmail;
      rememberMe.value = true;
    } else {
      rememberMe.value = false;
    }
  }

  void clearForm() {
    name.clear();
    email.clear();
    whatsapp.clear();
    password.clear();
    countryCode.text = '+977';
    address.text = '';
  }

  void clearPasswordForm() {
    currentPassword.clear();
    newPassword.clear();
    confirmPassword.clear();
  }

  // Check auth splash screen
  void checkAuth() {
    final token = _storage.getToken();
    if (token != null) {
      final cachedUser = _storage.getUser();
      if (cachedUser != null) {
        user.value = User.fromJson(cachedUser);
        name.text = user.value?.name ?? '';
        email.text = user.value?.email ?? '';
        whatsapp.text = user.value?.phone ?? '';
        countryCode.text = user.value?.countryCode ?? '+977';
        address.text = user.value?.address ?? '';
      }

      DioConnector.dio.options.headers["Authorization"] = "Bearer $token";

      final biometricEnabled = _storage.getBiometricEnabled();
      if (biometricEnabled) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(AppRoutes.login);
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(AppRoutes.home);
        });
        fetchUser();
      }
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(AppRoutes.login);
      });
    }
  }

  // Register user.
  Future<void> register() async {
    if (isLoading.value || Get.isSnackbarOpen) return;
    if (password.text.trim().length < 8) {
      Get.snackbar(
        "Error",
        "The password field must be at least 8 characters.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (!_isValidNepalPhoneNumber()) return;
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;
    try {
      isLoading(true);
      final response = await AuthService.register(
        name.text,
        email.text,
        whatsapp.text,
        password.text.trim(),
        countryCode.text,
      );
      if (response.statusCode == 200) {
        registerMessage.value = RegisterModel.fromJson(response.data);
        if (registerMessage.value.success == true) {
          Get.snackbar(
            "Success",
            "Registration successful",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          clearForm();
          Get.toNamed(AppRoutes.login);
        } else {
          Get.snackbar(
            "Error",
            registerMessage.value.errors?.email.isNotEmpty == true
                ? registerMessage.value.errors!.email[0]
                : "Registration failed",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        registerMessage.value = RegisterModel.fromJson(response.data);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // Login user.
  Future<void> login() async {
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;
    try {
      isLoading(true);

      final response = await AuthService.login(
        email.text.trim(),
        password.text,
      );

      loginMessage.value = LoginModel.fromJson(response.data);

      if (response.statusCode == 200 && loginMessage.value.success == true) {
        _storage.saveToken(loginMessage.value.token!);

        await _storage.saveLocalPassword(password.text);

        if (rememberMe.value) {
          await _storage.saveRememberedEmail(email.text.trim());
        } else {
          _storage.clearRememberedEmail();
        }
        DioConnector.dio.options.headers["Authorization"] =
            "Bearer ${loginMessage.value.token!}";

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
      Get.snackbar(
        "Error",
        loginMessage.value.message ?? "Login failed",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchUser() async {
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;
    try {
      final response = await AuthService.getUser();
      if (response.statusCode == 200) {
        final userResponse = UserModel.fromJson(response.data);
        user.value = userResponse.user;
        if (user.value != null) {
          address.text = user.value?.address ?? '';
          _storage.saveUser({
            "id": user.value!.id,
            "name": user.value!.name,
            "email": user.value!.email,
            "phone": user.value!.phone,
            "country_code": user.value!.countryCode,
            "address": user.value!.address,
          });
        }
      }
    } catch (_) {
      if (user.value == null) {
        final cachedUser = _storage.getUser();
        if (cachedUser != null) {
          user.value = User.fromJson(cachedUser);
          address.text = user.value?.address ?? '';
        }
      }
    }
  }

  Future<void> updateProfile() async {
    if (isLoading.value || Get.isSnackbarOpen) return;
    if (!_isValidNepalPhoneNumber()) return;
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;
    try {
      isLoading(true);
      final response = await AuthService.updateProfile(
        name.text,
        email.text.trim(),
        whatsapp.text,
        address.text,
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
            address: address.text,
          );
          _storage.saveUser({
            "id": user.value?.id,
            "name": user.value?.name,
            "email": user.value?.email,
            "phone": user.value?.phone,
            "country_code": user.value?.countryCode,
            "address": user.value?.address,
          });
          Get.snackbar(
            "Success",
            updateProfileMessage.value.message ??
                "Profile updated successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            updateProfileMessage.value.message ??
                "Please fill all fields correctly",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update profile",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
  //nepal phone number validation
  bool _isValidNepalPhoneNumber() {
  if (countryCode.text.trim() == '+977') {
    final phoneRaw = whatsapp.text.trim();
    final nepalPhoneRegex = RegExp(r'^(97|98)\d{8}$');
    
    if (!nepalPhoneRegex.hasMatch(phoneRaw)) {
      Get.snackbar(
        "Invalid Phone Number",
        "Nepal mobile numbers must be 10 digits and start with 97 or 98.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }
  return true;
}

  Future<void> resetPassword() async {
    // Validate all fields are filled
    if (isLoading.value || Get.isSnackbarOpen) return;

    if (currentPassword.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your current password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    final storedPassword = _storage.getLocalPassword();
    if (storedPassword == null || currentPassword.text != storedPassword) {
      Get.snackbar(
        "Error",
        "Incorrect current password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPassword.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your new password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (confirmPassword.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please confirm your new password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Validate new password and confirm password match
    if (newPassword.text != confirmPassword.text) {
      Get.snackbar(
        "Error",
        "New password and confirm password must match",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Validate new password is different from current password
    if (currentPassword.text == newPassword.text) {
      Get.snackbar(
        "Error",
        "New password must be different from current password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Validate new password minimum length
    if (newPassword.text.length < 8) {
      Get.snackbar(
        "Error",
        "New password must be at least 8 characters long",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    final network = Get.find<NetworkController>();
    if (!await network.checkConnectivity()) return;

    try {
      isLoading(true);
      // Send email and new password to backend
      final response = await AuthService.resetPassword(
        email.text.trim(),
        newPassword.text.trim(),
      );

      if (response.statusCode == 200) {
        resetPasswordMessage.value = ResetPasswordModel.fromJson(response.data);
        if (resetPasswordMessage.value.success == true) {
          await _storage.saveLocalPassword(newPassword.text.trim());
          clearPasswordForm();
          Get.snackbar(
            "Success",
            resetPasswordMessage.value.message ??
                "Password updated successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            resetPasswordMessage.value.message ?? "Failed to update password",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          resetPasswordMessage.value.message ?? "Failed to update password",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update password: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  //logout
  void logout() {
    _storage.clearSession();
    _storage.clearLocalPassword();
    user.value = null;
    clearForm();
    if (rememberMe.value) {
      final rememberedEmail = _storage.getRememberedEmail();
      if (rememberedEmail != null && rememberedEmail.isNotEmpty) {
        email.text = rememberedEmail;
      }
    } else {
      _storage.clearRememberedEmail();
      rememberMe.value = false;
      email.clear();
    }
    DioConnector.dio.options.headers.remove('Authorization');
    Get.offAllNamed(AppRoutes.login);
  }

  void logOut() {
    logout();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    whatsapp.dispose();
    password.dispose();
    countryCode.dispose();
    address.dispose();
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
