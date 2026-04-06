import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController{
Future saveToken(String token) async {
  await GetStorage().write("token", token);

}
String? getToken(){
  return GetStorage().read("token");
}

void deleteToken(){
  GetStorage().erase();
}

}