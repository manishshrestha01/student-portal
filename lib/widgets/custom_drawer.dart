import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/view/certificates_view.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/payment_page_view.dart';
import 'package:codeit_app/view/profile_view.dart';
import 'package:codeit_app/view/security_view.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final bool isSmall = screenWidth < 390;
        final bool isMedium = screenWidth >= 500 && screenWidth < 768;

        final double iconWidth = isSmall ? 26 : (isMedium ? 29 : 31);
        final double iconHeight = isSmall ? 24 : (isMedium ? 27 : 29.05);
        final double itemFontSize = isSmall ? 18 : (isMedium ? 20 : 20);
        final double titleFontSize = isSmall ? 32 : (isMedium ? 36 : 40);
        final double gapSize = isSmall ? 30 : (isMedium ? 35 : 40);
        final double leftPadding = isSmall ? 24 : (isMedium ? 28 : 30);
        final double logoutLeftPadding = isSmall ? 80 : (isMedium ? 60 : 90);

        return Drawer(
          width: screenWidth < 500 ? screenWidth * 0.75 : (screenWidth < 900 ? 350 : 400),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFf85604),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "</> CODE IT",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(thickness: 0.5, color: const Color(0xFFFEFEFE)),
                  Gap(gapSize),
                  ListTile(
                    onTap: () => Get.offAll(() => HomeView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/dashboard.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => CourseView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/course.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => const CertificatesView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/certificates.svg',
                      width: iconWidth,
                      height: iconHeight,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFFFFFFF),
                        BlendMode.srcIn,
                      ),
                    ),
                    title: Text(
                      "Certificates",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(() => PaymentPage()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/receipt.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => const SupportView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/support.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => const SuggestionsView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/message.svg',
                      width: iconWidth, 
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => const TermsView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/conditions.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => const ProfileView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/profile.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.offAll(() => const SecurityView()),
                    contentPadding: EdgeInsets.only(left: leftPadding),
                    leading: Icon(Icons.shield, color: Colors.white, size: iconWidth),
                    title: Text(
                      "Security",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Divider(thickness: 0.5, color: const Color(0xFFFEFEFE)),
                  ListTile(
                    onTap: () {
                      authController.logOut();
                    },
                    contentPadding: EdgeInsets.only(left: logoutLeftPadding),
                    leading: SvgPicture.asset(
                      'assets/support/logout.svg',
                      width: iconWidth,
                      height: iconHeight,
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
                          fontSize: itemFontSize,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
