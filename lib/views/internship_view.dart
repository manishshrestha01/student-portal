import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/support_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InternshipView extends StatefulWidget {
  const InternshipView({super.key});

  @override
  State<InternshipView> createState() => _InternshipViewState();
}

class _InternshipViewState extends State<InternshipView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Gap(20),
            Row(
              children: [
                Gap(20),
                Text(
                  "Create Support Ticket",
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
            Gap(8),
            Row(
              children: [
                Gap(20),
                Text(
                  "Internship Support — Describe your issue and\nwe'll respond as soon as possible.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Gap(20),
                SizedBox(
                  child: Column(
                    children: [
                      Gap(24),
                      Container(
                        width: 352.94,
                        height: 528.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFF3F4F6),
                            width: 0.77,
                          ),
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
                        child: Column(
                          children: [
                            Gap(21),
                            Row(
                              children: [
                                Gap(21),
                                Container(
                                  width: 4,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(
                                      25953100,
                                    ),
                                  ),
                                ),
                                Gap(8),
                                Text(
                                  "Ticket Information",
                                  style: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.31,
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Gap(20),
                                Text(
                                  "Category",
                                  style: TextStyle(
                                    color: AppColors.lightblue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ],
                            ),
                            Gap(8),
                            Container(
                              width: 311.42,
                              height: 45.51,
                              decoration: BoxDecoration(
                                color: AppColors.cannotedit,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Gap(20),
                                  Text(
                                    "Internship Support",
                                    style: TextStyle(
                                      color: AppColors.lightblue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: -0.15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Gap(20),
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                    color: AppColors.lightblue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            Gap(8),
                            Container(
                              width: 311.42,
                              height: 45.51,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "e.g. Cannot access course materials",
                                  hintStyle: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Gap(20),
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    color: AppColors.lightblue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            Gap(8),
                            Container(
                              width: 311.42,
                              height: 145.46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                ),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                expands: true,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "Please explain in detail what happened,\nwhat you tried, any error messages, etc.",
                                  hintStyle: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(
                                    20,
                                    16,
                                    20,
                                    16,
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Gap(21),
                                Center(
                                  child: SizedBox(
                                    width: 200,
                                    height: 47.98,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/support/Send.svg',
                                        colorFilter: const ColorFilter.mode(
                                          Colors.white,
                                          BlendMode.srcIn,
                                        ),
                                        width: 16,
                                        height: 16,
                                      ),
                                      label: Text(
                                        "Submit Ticket",
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
                                        backgroundColor: const Color(
                                          0xFFF85604,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(12),
                                SizedBox(
                                    width: 93.34,
                                    height: 47.98,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Get.offAll(()=>SupportView());
                                      },
                                      label: Text(
                                        "Cancel",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: AppColors.lightblue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.15,
                                          ),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFF3F4F6,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(14),
                                        ),
                                      ),
                                    ),
                                  ),
                               
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
