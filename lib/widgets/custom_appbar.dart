import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

 CustomAppBar({super.key, this.title});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(title ?? "Code IT", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      actions: [
        Row(
          children: [
            Obx(() {
              final user = authController.user.value;
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/profile");
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFF4F6CF7),
                      child: Text(
                        (user?.name?.isNotEmpty == true)
                            ? user!.name![0].toUpperCase()
                            : "?",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (user != null)
                    Text(
                      user.name!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  else
                    const Text(
                      "User",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                ],
              );
            }),
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                Get.defaultDialog(
                  title: "Logout",
                  middleText: "Are you sure you want to logout?",
                  textConfirm: "Yes",
                  textCancel: "No",
                  confirmTextColor: Colors.white,
                  buttonColor: AppColors.primary,
                  onConfirm: () {
                    Get.back();
                    authController.logout();
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
