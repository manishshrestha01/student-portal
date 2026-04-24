import 'package:codeit_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:codeit_app/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

 CustomAppBar({super.key, this.title});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actionsPadding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/code-it-logo.png',
          height: 33,
          width: 300,
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: (){
              Get.offAll(ProfileView());
            },
            icon: SvgPicture.asset(
              'assets/support/profile_appbar.svg',
              width: 16.66666603088379,
              height: 16.66666603088379,
              colorFilter: const ColorFilter.mode(
                Color(0xFFFFFFFF),
                BlendMode.srcIn,
              ),
            ),
            label: Obx(() {
              final user = authController.user.value;
              final firstName = (user?.name ?? '').split(' ').first;
              return Text(
                firstName.isNotEmpty ? firstName : "Name",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF6900),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
        shape: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
    );
      }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
