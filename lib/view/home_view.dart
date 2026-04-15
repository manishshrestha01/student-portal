import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
       body: Obx(() {
        final user = authController.user.value;

        if (user == null) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF4F6CF7)),
          );
        }

        final firstName = (user.name ?? '').split(' ').first;
        return Center(
          child: Text(
            "Welcome, $firstName",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A2E),
            ),
          ),
        );
      }),
    );
  }
}
