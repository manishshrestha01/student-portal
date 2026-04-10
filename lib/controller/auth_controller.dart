import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/model/login_model.dart';
import 'package:codeit_app/model/register_model.dart';
import 'package:codeit_app/model/reset_password_model.dart';
import 'package:codeit_app/model/user_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
 var registerMessage = RegisterModel(success: null, errors: null).obs;
  var isLoading = false.obs;
  var loginMessage = LoginModel(success: null, token: null, message: null).obs;
  var user = Rxn<User>();


var rememberMe = false.obs;
    //for password toggle
  var isPasswordHidden = true.obs;
  var currentPasswordHidden = true.obs;
  var newPasswordHidden = true.obs;
  var confirmPasswordHidden = true.obs;


  // Text editing controllers
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

  // Check auth on splash screen
  void checkAuth() {
    var token = StorageController().getToken();
    if (token != null) {
      var storedUser = StorageController().getUser();
      if (storedUser != null) {
        user.value = User.fromJson(storedUser);
      }
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.home);
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.login);
      });
    }
  }

  // Register user
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
      if (response.statusCode == 200) {
        registerMessage.value = RegisterModel.fromJson(response.data);
        if (registerMessage.value.success == true) {
          Get.snackbar("Success", "Registration successful");
          clearForm();
          Get.toNamed(AppRoutes.login);
        }
        else{
          Get.snackbar("Error", registerMessage.value.errors?.email.isNotEmpty == true
              ? registerMessage.value.errors!.email[0]
              : "Registration failed");
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

  // Login user
  Future login() async {
    try {
      isLoading(true);
      var response = await AuthService.login(email.text, password.text);
      print(response.data);

      if (response.statusCode == 200) {
        loginMessage.value = LoginModel.fromJson(response.data);

        if (loginMessage.value.success == true) {
          // Save token first and getuser
          StorageController().saveToken(loginMessage.value.token!);

          // fetch user and save to storage
          await fetchAndSaveUser();

          Get.snackbar("Success", "Login successful");
          clearForm();
          Get.offAllNamed(AppRoutes.home);

        }
        else{
          Get.snackbar("Error", loginMessage.value.message ?? "Login failed");
        }
      }
    } catch (e) {
      Get.snackbar("Error", loginMessage.value.message ?? "Login failed");
    } finally {
      isLoading(false);
    }
  }

  
// Update user profile
  Future updateProfile() async {
    try {
      isLoading(true);
      var response = await AuthService.updateProfile(
        name.text,
        email.text,
        whatsapp.text,
        countryCode.text,
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Profile updated successfully");
        await fetchAndSaveUser();

      } else {
        Get.snackbar("Error", "Failed to update profile");
      }
    } catch (e) {
      print("Error updating profile: $e");
      Get.snackbar("Error:", "An error occurred");
    } finally {
      isLoading(false);
    }
  }
  
//reset password
var currentPassword = TextEditingController();
var newPassword = TextEditingController();
var confirmPassword = TextEditingController();

Future resetPassword() async{
  final current = currentPassword.text.trim();
  final newPass = newPassword.text.trim();
  final confirm = confirmPassword.text.trim();

  if (current.isEmpty || newPass.isEmpty || confirm.isEmpty){
    Get.snackbar("Error", "All fields are required");
    return;
  }

   if (newPass != confirm) {
      Get.snackbar("Error", "New pasword and confirm password do not match");
      return;
    }

    try{
      var response = await AuthService.resetPassword(current, newPass, confirm);
      print(response.data);

      if(response.statusCode == 200){
        final result = ResetPasswordModel.fromJson(response.data);
        if(result.success == true){
          Get.snackbar("Success", result.message ?? "Password Updated SuccessFully!");
          currentPassword.clear();
          newPassword.clear();
          confirmPassword.clear();
        }else{
                    Get.snackbar("Error", result.message ?? "Password update failed");
        }
      }else{
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
      }

    }
    catch(e){
      print("Error: $e");
      Get.snackbar("Error", "Error occured: $e");
    }
}


//fetches user from API and saves to storage
  Future fetchAndSaveUser() async {
    try {
      var userResponse = await AuthService.getUser();
      if (userResponse.statusCode == 200) {
        var userModel = UserModel.fromJson(userResponse.data);
        if (userModel.user != null) {
          user.value = userModel.user;
          StorageController().saveUser(userResponse.data["user"]);
        }
      }
    } catch (e) {
      print("Failed to fetch user: $e");
    }
  }


  // Logout user
  void logout() {
    user.value = null; 
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
