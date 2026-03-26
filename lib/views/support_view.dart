import 'package:codeit_app/core/constants/app_size.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/counseling_view.dart';
import 'package:codeit_app/views/general_view.dart';
import 'package:codeit_app/views/internship_view.dart';
import 'package:codeit_app/views/technical_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBar(
        title: Text(
          "CODE IT",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.01,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFFf85604),
        foregroundColor: const Color(0xFFFFFFFF),
        elevation: 6.0,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(AppSize.gap),
            //w1
            Row(
              children: [
                Gap(AppSize.gap),
                Text(
                  "Support Center",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.07,
                    ),
                  ),
                ),
              ],
            ),
            //w2
            Gap(AppSize.gap8),
            Row(
              children: [
                Gap(AppSize.gap),
                Text(
                  "How can we help you today?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.31,
                    ),
                  ),
                ),
              ],
            ),
            //w3
            Gap(AppSize.gap24),
            Container(
              width: 352.94,
              height: 169.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF3F4F6), width: 0.77),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: -1,
                  ),
                ],
              ),
              //w2 logo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSize.gap21),
                  SizedBox(
                    child: Row(
                      children: [
                        Gap(AppSize.gap21),
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset(
                            'assets/support/general-support.svg',
                            width: 19,
                            height: 19,
                            colorFilter: ColorFilter.mode(
                              const Color(0xFF2B7FFF),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Gap(AppSize.gap16),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "General Support",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.31,
                                  ),
                                ),
                              ),
                              Gap(AppSize.gap4),
                              Text(
                                "Course queries, account issues,\nand general questions",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSize.gap16),
                  Center(
                    child: SizedBox(
                      width: 311.42,
                      height: 43.97,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.offAll(()=>GeneralView(1));
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        label: Text(
                          "Create Ticket",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.boxColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.15,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B7FFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //w4
            Gap(AppSize.gap16),
            Container(
              width: 352.94,
              height: 169.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF3F4F6), width: 0.77),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: -1,
                  ),
                ],
              ),
              //w4 logo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSize.gap21),
                  SizedBox(
                    child: Row(
                      children: [
                        Gap(AppSize.gap21),
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF7ED),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset(
                            'assets/support/technical-support.svg',
                            width: 19,
                            height: 19,
                            colorFilter: ColorFilter.mode(
                              const Color(0xFFF85604),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Gap(AppSize.gap16),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Technical Support",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.31,
                                  ),
                                ),
                              ),
                              Gap(AppSize.gap4),
                              Text(
                                "App bugs, login problems,\nand technical difficulties",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSize.gap16),
                  Center(
                    child: SizedBox(
                      width: 311.42,
                      height: 43.97,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.offAll(()=>TechnicalView());
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        label: Text(
                          "Create Ticket",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.boxColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.15,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF85604),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //w5
            Gap(AppSize.gap16),
            Container(
              width: 352.94,
              height: 169.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF3F4F6), width: 0.77),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: -1,
                  ),
                ],
              ),
              //w5 logo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSize.gap21),
                  SizedBox(
                    child: Row(
                      children: [
                        Gap(AppSize.gap21),
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFF0FDF4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset(
                            'assets/support/counselling-support.svg',
                            width: 19,
                            height: 19,
                            colorFilter: ColorFilter.mode(
                              const Color(0xFF00C950),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Gap(AppSize.gap16),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Counseling Support",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.31,
                                  ),
                                ),
                              ),
                              Gap(AppSize.gap4),
                              Text(
                                "Career guidance, course selection,\nand mentorship",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSize.gap16),
                  Center(
                    child: SizedBox(
                      width: 311.42,
                      height: 43.97,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.offAll(()=>CounselingView());
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        label: Text(
                          "Create Ticket",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.boxColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.15,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00C950),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //w6
            Gap(AppSize.gap16),
            Container(
              width: 352.94,
              height: 169.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFAF5FF), width: 0.77),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: -1,
                  ),
                ],
              ),
              //w6 logo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSize.gap21),
                  SizedBox(
                    child: Row(
                      children: [
                        Gap(AppSize.gap21),
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset(
                            'assets/support/internship-support.svg',
                            width: 19,
                            height: 19,
                            colorFilter: ColorFilter.mode(
                              const Color(0xFFAD46FF),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Gap(AppSize.gap16),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Internship Support",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.31,
                                  ),
                                ),
                              ),
                              Gap(AppSize.gap4),
                              Text(
                                "Internship opportunities, applications,\nand placements",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSize.gap16),
                  Center(
                    child: SizedBox(
                      width: 311.42,
                      height: 43.97,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.offAll(()=>InternshipView());
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        label: Text(
                          "Create Ticket",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.boxColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.15,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAD46FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //w7
            Gap(AppSize.gap24),
            Text(
              "Need immediate assistance?",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.15,
                ),
              ),
            ),
            //w8
            Gap(AppSize.gap16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "support@codeit.com",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.15,
                    ),
                  ),
                ),
                Gap(AppSize.gap12),
                Text(
                  "|",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.15,
                    ),
                  ),
                ),
                Gap(AppSize.gap12),
                Text(
                  "+977 981-2345678",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
