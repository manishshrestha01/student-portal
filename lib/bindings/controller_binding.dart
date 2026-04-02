import 'package:codeit_app/controller/auth_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}