import 'package:codeit_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isLoggedIn = false.obs;

  void checkAuth(){
    Future.delayed(Duration(seconds: 3), (){
      Get.offAllNamed(AppRoutes.login);
    });
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}