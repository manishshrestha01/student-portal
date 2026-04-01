import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'support_view.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({super.key});

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
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
                    Get.offAll(() => SupportView());
                  },
                  child: Row(
                    children: [
                      Gap(18),
                      SvgPicture.asset(
                        'assets/support/home.svg',
                        width: 19.17,
                        height: 17.35,
                        colorFilter: const ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.7),
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(8),
                      Text(
                        "Home",
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(7),
                Icon(
                  Icons.chevron_right,
                  color: const Color.fromRGBO(0, 0, 0, 0.9),
                ),
                Gap(7),
                Text(
                  "Suggestions",
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

            Row(
              children: [
                Gap(18),
                Text(
                  "Suggestions",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Gap(32),
            //box
            Container(
              alignment: Alignment.center,
              height: 383,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(20),
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
                children: [
                  Gap(10),
                  //title
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gap(32),
                        Text(
                          "Help Us Improve Our Online Class",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //desc
                  Gap(4),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gap(32),
                        Text(
                          "Do you have any suggestions for improving\nour online classes?",
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
                  Gap(18),
                  //message
                  Row(
                    children: [
                      Gap(18),
                      SvgPicture.asset(
                        'assets/support/message.svg',
                        width: 22,
                        height: 20.62,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFFF6900),
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(10),
                      Text(
                        "Your Suggestion",
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  SizedBox(
                    width: 350,
                    height: 156,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      decoration: InputDecoration(
                        hintText: "We’d love to hear your ideas.....",
                        hintStyle: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xB3000000),
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xB3000000),
                            width: 0.5,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xB3000000),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/support/submit.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              width: 22.5,
                              height: 22.5,
                            ),
                            label: Text(
                              "Submit Ticket",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: AppColors.boxColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0,
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
