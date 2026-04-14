import 'dart:math' as math;

import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/general_view.dart';
import 'package:codeit_app/view/counseling_view.dart';
import 'package:codeit_app/view/internship_view.dart';
import 'package:codeit_app/view/profile_view.dart';
import 'package:codeit_app/view/suggestions_view.dart';
import 'package:codeit_app/view/technical_view.dart';
import 'package:codeit_app/view/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  static const String _supportDescription =
      'Questions about courses, payments, schedule, enrollment or other general inquiries.';

  @override
  Widget build(BuildContext context) {
        var authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: Image.asset(
          'assets/images/code-it-logo.png',
          height: 33,
          width: 300,
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/support/profile_appbar.svg',
              width: 16.66666603088379,
              height: 16.66666603088379,
              colorFilter: const ColorFilter.mode(
                Color(0xFFFFFFFF),
                BlendMode.srcIn,
              ),
            ),
            label: Text(
              "Name",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF6900),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
        shape: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
      ),
      drawer: Drawer(
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
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
          final double contentWidth = math.min(
            screenWidth - (horizontalPadding * 2),
            620,
          );
          final double cardHeight = isSmall ? 238 : 252;
          final double buttonHeight = isSmall ? 52 : 50;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(isSmall ? 24 : 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildBreadcrumb(isSmall),
                  ),
                  Gap(isSmall ? 24 : 32),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: contentWidth),
                      child: Text(
                        'How can we help you today?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: AppColors.textDark,
                            fontSize: isSmall ? 22 : 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(11),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: contentWidth),
                      child: Text(
                        "Choose the category that best matches your question and we'll get back to you quickly.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: AppColors.textDark,
                            fontSize: isSmall ? 12 : 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(23),
                  _buildSupportCard(
                    onTap: () => Get.offAll(() => const GeneralView()),
                    cardWidth: contentWidth,
                    cardHeight: cardHeight,
                    isSmall: isSmall,
                    iconPath: 'assets/support/general.svg',
                    iconColor: const Color(0xFF22408B),
                    title: 'General Support',
                    description: _supportDescription,
                  ),
                  const Gap(23),
                  _buildSupportCard(
                    onTap: () => Get.offAll(() => const TechnicalView()),
                    cardWidth: contentWidth,
                    cardHeight: cardHeight,
                    isSmall: isSmall,
                    iconPath: 'assets/support/technical.svg',
                    iconColor: const Color(0xFFBC120E),
                    title: 'Technical Support',
                    description: _supportDescription,
                  ),
                  const Gap(23),
                  _buildSupportCard(
                    onTap: () => Get.offAll(() => const CounselingView()),
                    cardWidth: contentWidth,
                    cardHeight: cardHeight,
                    isSmall: isSmall,
                    iconPath: 'assets/support/counselling.svg',
                    iconColor: const Color(0xFF138023),
                    title: 'Counselling Support',
                    description: _supportDescription,
                  ),
                  const Gap(23),
                  _buildSupportCard(
                    onTap: () => Get.offAll(() => const InternshipView()),
                    cardWidth: contentWidth,
                    cardHeight: cardHeight,
                    isSmall: isSmall,
                    iconPath: 'assets/support/internship.svg',
                    iconColor: const Color(0xFF9A1CB9),
                    title: 'Internship Support',
                    description: _supportDescription,
                  ),
                  Gap(isSmall ? 40 : 70),
                  Center(
                    child: SizedBox(
                      width: contentWidth,
                      height: buttonHeight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.offAll(TicketView());
                        },
                        icon: SvgPicture.asset(
                          'assets/support/ticket.svg',
                          width: 23.83,
                          height: 21.67,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFFFFFFF),
                            BlendMode.srcIn,
                          ),
                        ),
                        label: Text(
                          'View My Existing Tickets',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: isSmall ? 18 : 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6900),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(isSmall ? 32 : 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBreadcrumb(bool isSmall) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => const SuggestionsView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.7),
                  BlendMode.srcIn,
                ),
              ),
              const Gap(8),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontSize: isSmall ? 13 : 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(7),
        Icon(
          Icons.chevron_right,
          color: const Color.fromRGBO(0, 0, 0, 0.9),
          size: isSmall ? 18 : 20,
        ),
        const Gap(7),
        Text(
          'Support',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color(0xFF000000),
              fontSize: isSmall ? 13 : 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSupportCard({
    required VoidCallback onTap,
    required double cardWidth,
    required double cardHeight,
    required bool isSmall,
    required String iconPath,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 30),
                child: Column(
                  children: [
                    Gap(isSmall ? 18 : 20),
                    SvgPicture.asset(
                      iconPath,
                      width: isSmall ? 56 : 61,
                      height: isSmall ? 56 : 61,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                    Gap(isSmall ? 18 : 20),
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: isSmall ? 20 : 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Gap(6),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: isSmall ? 13 : 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 43,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 0.5),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Create Ticket',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: const Color(0xFFFF6900),
                            fontSize: isSmall ? 15 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Gap(6),
                      const Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Color(0xFFFF6900),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
