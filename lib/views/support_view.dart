import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/counseling_view.dart';
import 'package:codeit_app/views/general_view.dart';
import 'package:codeit_app/views/internship_view.dart';
import 'package:codeit_app/views/suggestions_view.dart';
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
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("CODEIT")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(32),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => SuggestionsView());
                  },
                  child: Row(
                    children: [
                      Gap(18),
                      SvgPicture.asset(
                        'assets/support/home.svg',
                        width: 19.17,
                        height: 17.35,
                        colorFilter: const ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.70),
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(8),
                      Text(
                        "Home",
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.70),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(7),
                Icon(Icons.chevron_right, color: const Color.fromRGBO(0, 0, 0, 0.9)),
                Gap(7),
                Text(
                  "Support",
                  style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            Gap(32),
            //w1
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gap(32),
                  Text(
                    "How can we help you today?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //w2
            Gap(11),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gap(32),
                  Text(
                    "Choose the category that best matches\nyour question and we’ll get back to you\nquickly.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(23),
            GestureDetector(
              onTap: () => Get.offAll(() => GeneralView()),
              child: Container(
                width: 391,
                height: 252,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Gap(20),
                          SvgPicture.asset(
                            'assets/support/general.svg',
                            width: 61,
                            height: 61,
                            colorFilter: ColorFilter.mode(
                              Color(0xFF22408B),
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(30),
                          Text(
                            "General Support",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Gap(4),
                          Text(
                            "Questions about courses, payments, schedule,\nenrollment or other general inquiries.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 43,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
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
                              "Create Ticket",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color(0xFFFF6900),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Gap(6),
                            Icon(
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
            Gap(23),
            GestureDetector(
              onTap: () => Get.offAll(() => const TechnicalView()),
              child: Container(
                width: 391,
                height: 252,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Gap(20),
                          SvgPicture.asset(
                            'assets/support/technical.svg',
                            width: 61,
                            height: 61,
                            colorFilter: ColorFilter.mode(
                              Color(0xFFBC120E),
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(30),
                          Text(
                            "Technical Support",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Gap(4),
                          Text(
                            "Questions about courses, payments, schedule,\nenrollment or other general inquiries.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 43,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
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
                              "Create Ticket",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color(0xFFFF6900),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Gap(6),
                            Icon(
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
            Gap(23),
            GestureDetector(
              onTap: () => Get.offAll(() => const CounselingView()),
              child: Container(
                width: 391,
                height: 252,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Gap(20),
                          SvgPicture.asset(
                            'assets/support/counselling.svg',
                            width: 61,
                            height: 61,
                            colorFilter: ColorFilter.mode(
                              Color(0xFF138023),
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(30),
                          Text(
                            "Counselling Support",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Gap(4),
                          Text(
                            "Questions about courses, payments, schedule,\nenrollment or other general inquiries.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 43,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
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
                              "Create Ticket",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color(0xFFFF6900),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Gap(6),
                            Icon(
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
            Gap(23),
            GestureDetector(
              onTap: () => Get.offAll(() => const InternshipView()),
              child: Container(
                width: 391,
                height: 252,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Gap(20),
                          SvgPicture.asset(
                            'assets/support/internship.svg',
                            width: 61,
                            height: 61,
                            colorFilter: ColorFilter.mode(
                              Color(0xFF9A1CB9),
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(30),
                          Text(
                            "Internship Support",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Gap(4),
                          Text(
                            "Questions about courses, payments, schedule,\nenrollment or other general inquiries.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 43,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
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
                              "Create Ticket",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color(0xFFFF6900),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Gap(6),
                            Icon(
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
            Gap(70),
            Center(
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Get.offAll(() => SupportView());
                  },
                  icon: SvgPicture.asset(
                    'assets/support/ticket.svg',
                    width: 23.833330154418945,
                    height: 21.666669845581055,
                    colorFilter: ColorFilter.mode(
                      Color(0xFFFFFFFF),
                      BlendMode.srcIn,
                    ),
                  ),

                  label: Text(
                    "View My Exiting Tickets ",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6900),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Gap(50),
          ],
        ),
      ),
    );
  }
}
