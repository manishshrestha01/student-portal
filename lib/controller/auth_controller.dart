import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/login_model.dart';
import 'package:codeit_app/model/register_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var registerMessage = RegisterModel(success: false, errors: null).obs;
  var isLoading = false.obs;

  var loginMessage = LoginModel(success: false, token: null, message: null).obs;

  //Text editing controller
  var name = TextEditingController();
  var email = TextEditingController();
  var whatsapp = TextEditingController();
  var password = TextEditingController();
  var countryCode = TextEditingController();

  void clearForm() {
    name.clear();
    email.clear();
    whatsapp.clear();
    password.clear();
    countryCode.clear();
  }

  //check auth splash screen
  void checkAuth() {
    var token = StorageController().getToken();
    if (token != null) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.profile);
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.login);
      });
    }
  }

  //register user
  Future register() async {
    try {
      isLoading(true);
      var response = await AuthService.register(
        name.text,
        email.text,
        whatsapp.text,
        password.text,
        countryCode.text,
      );
      print(response.data);
      if (response.statusCode == 200) {
        registerMessage.value = RegisterModel.fromJson(response.data);
        if (registerMessage.value.success == true) {
          Get.snackbar("Success", "Registration successful");
          clearForm();
          Get.toNamed(AppRoutes.login);
        }
      } else {
        registerMessage.value = RegisterModel.fromJson(response.data);
      }
    } catch (e) {
      Get.snackbar("Error", loginMessage.value.message ?? "An error occurred");
    } finally {
      isLoading(false);
    }
  }

  //login user
  Future login() async {
    try {
      isLoading(true);
      var response = await AuthService.login(email.text, password.text);
      print(response.data);
      if (response.statusCode == 200) {
        loginMessage.value = LoginModel.fromJson(response.data);

        if (loginMessage.value.success == true) {
          Get.snackbar("Success", "Login successful");
          //save token to storage
          StorageController().saveToken(loginMessage.value.token!);

          clearForm();
          Get.offAllNamed(AppRoutes.profile); //navigate to profile page
        }
      }
    } catch (e) {
      Get.snackbar("Error", loginMessage.value.message ?? "Login failed");
    } finally {
      isLoading(false);
    }
  }

  void logout(){
    StorageController().deleteToken();
    isLoggedIn(false);
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}
