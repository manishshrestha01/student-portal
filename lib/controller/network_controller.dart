import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkController extends GetxController {
  late StreamSubscription<InternetStatus> _connectionSubscription;
  bool _isConnected = true; 

  @override
  void onInit() {
    super.onInit();
    
    InternetConnection().internetStatus.then((status) {
      _isConnected = (status == InternetStatus.connected);
    });

    _connectionSubscription =
        InternetConnection().onStatusChange.listen((status) {
      _isConnected = (status == InternetStatus.connected);
      if (_isConnected) {
        Get.closeAllSnackbars();
      }
    });
  }

  Future<bool> checkConnectivity() async {
    if (_isConnected) {
      return true;
    }
    _isConnected = await InternetConnection().hasInternetAccess;   
    if (!_isConnected) {
      Get.closeAllSnackbars();
      Get.rawSnackbar(
        messageText: const Row(
          children: [
            Icon(Icons.wifi_off, color: Colors.white, size: 22),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'No Internet Connection',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        borderRadius: 10,
        duration: const Duration(seconds: 3),
        isDismissible: false,
        snackStyle: SnackStyle.FLOATING,
      );
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    _connectionSubscription.cancel();
    super.onClose();
  }
}