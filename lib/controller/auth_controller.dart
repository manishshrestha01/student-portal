import 'package:codeit_app/model/register_model.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var message = RegisterModel(success: false, errors: null).obs;
  var isLoading = false.obs;

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

  void checkAuth() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
  
//register user
 Future register() async{
try{
  isLoading(true);
var response = await AuthService.register(name.text, email.text, whatsapp.text, password.text, countryCode.text);
print(response.data);
if(response.statusCode == 200){
message.value = RegisterModel.fromJson(response.data);
if(message.value.success == true){
  Get.snackbar("Success", "Registration successful");
  clearForm();
  Get.toNamed(AppRoutes.login);
}

}else{
message.value = RegisterModel.fromJson(response.data);
}

}finally{
isLoading(false);
}
 }



  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}
