import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final box = GetStorage('MyStorage');
final biometricEnabled = false.obs;

@override
  void onInit() {
    super.onInit();
    biometricEnabled.value = box.read("biometric_enabled") ?? false;
  }


  Future<void> saveToken(String token) async {
    await box.write("token", token);
  }

  String? getToken() {
    return box.read("token");
  }

  void deleteToken() {
    box.remove("token");
    box.remove("user");
    box.remove("biometric_enabled");
     biometricEnabled.value = false;
  }

  void clearSession() {
    box.remove("user");
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    await box.write("user", user);
  }

  // Save login state for biometric unlock
  Future<void> saveBiometricEnabled(bool value) async {
    await box.write("biometric_enabled", value);
    biometricEnabled.value = value;
  }

  bool getBiometricEnabled() {
    return box.read("biometric_enabled") ?? false;
  }

  Map<String, dynamic>? getUser() {
    final data = box.read("user");
    return data != null ? Map<String, dynamic>.from(data) : null;
  }
}
