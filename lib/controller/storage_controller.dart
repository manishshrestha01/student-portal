import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController{
final box = GetStorage();

Future saveToken(String token) async {
  await box.write("token", token);

}
String? getToken(){
  return box.read("token");
}

void deleteToken(){
  box.remove("token");
  box.remove("user");
}

void saveUser(Map<String, dynamic> user) async {
  await box.write("user", user);
}

Map<String, dynamic>? getUser(){
  final data = box.read("user");
  return data != null ? Map<String, dynamic>.from(data) : null;
}

}