import 'dart:math' as math;

import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/view/profile_view.dart';
import 'package:codeit_app/view/suggestions_view.dart';
import 'package:codeit_app/view/support_view.dart';
import 'package:codeit_app/view/terms_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF6900), Color(0xFFFB9252)],
            begin: Alignment.center,
            end: Alignment.bottomRight,
            transform: GradientRotation(math.pi / 4),
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "</> CODE IT",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(thickness: 0.5, color: const Color(0xFFFEFEFE)),
            Gap(40),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/dashboard.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Dashboard",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/course.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "My Courses",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/certificates.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Certificate",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/receipt.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Payment Receipts",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () => Get.offAll(() => const SupportView()),
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/support.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Support",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () => Get.offAll(() => const SuggestionsView()),
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/message.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Suggestions",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () => Get.offAll(() => const TermsView()),
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/conditions.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Terms & Conditions",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () => Get.offAll(() => const ProfileView()),
              contentPadding: EdgeInsets.only(left: 30),
              leading: SvgPicture.asset(
                'assets/support/profile.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Profile",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            Gap(230),
            Divider(thickness: 0.5, color: const Color(0xFFFEFEFE)),
            ListTile(
              onTap: () {
                authController.logOut();
              },
              contentPadding: EdgeInsets.only(left: 90),
              leading: SvgPicture.asset(
                'assets/support/logout.svg',
                width: 31,
                height: 29.04893684387207,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFFFFF),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Logout",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
