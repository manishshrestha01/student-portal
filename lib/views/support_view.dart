import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
            Gap(20),
            //w1
            Row(
              children: [
                Gap(20),
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
            Gap(8),
            Row(
              children: [
                Gap(20),
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
            Gap(24),
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
                  Gap(21),
                  SizedBox(
                    child: Row(
                      children: [
                        Gap(21),
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
                        Gap(16),
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
                              Gap(4),
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
                  Gap(16),
                  Center(
                    child: SizedBox(
                      width: 311.42,
                      height: 43.97,
                      child: ElevatedButton.icon(
                        onPressed: () {},
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
                        ),style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2B7FFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(14)
                        ))
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //w4
            //w5
            //w6
            //w7
          ],
        ),
      ),
    );
  }
}
