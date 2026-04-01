import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/support_view.dart';
import 'package:codeit_app/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class CounselingView extends StatefulWidget {
  const CounselingView({super.key});

  @override
  State<CounselingView> createState() => _CounselingViewState();
}

class _CounselingViewState extends State<CounselingView> {
    String selectedCategory = "Counselling Support";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("CODEIT")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(30),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAll(()=> SupportView());
                  },
                  child: Row(
                    children: [
                      Gap(18),
                      SvgPicture.asset(
                        'assets/support/home.svg',
                        width: 19.17,
                        height: 17.35,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF4B4B4B),
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(8),
                      Text(
                        "Home",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: const Color(0xFF4b4b4b),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(7),
                Icon(Icons.chevron_right, color: const Color(0xFF4b4b4b)),
                Gap(7),
                Text(
                  "Support",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: const Color(0xFF4b4b4b),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Gap(7),
                Icon(Icons.chevron_right, color: const Color(0xFF4b4b4b)),
                Gap(7),
                Text(
                  "New Tickets",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: const Color(0xFF4b4b4b),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Support Ticket",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
            Gap(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Describe your issue — we'll respond as\nsoon as possible.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
            Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(21),
                SvgPicture.asset(
                  'assets/support/bi_ticket-fill.svg',
                  width: 26,
                  height: 16.25,
                  colorFilter: ColorFilter.mode(
                    Color(0xFFFF6900),
                    BlendMode.srcIn,
                  ),
                ),

                Gap(8),
                Text(
                  "Ticket Information",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(20),
                      Container(
                        width: 315,
                        height: 470,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFFFFFFF)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Gap(10),
                            Row(
                              children: [
                                Gap(20),
                                Text(
                                  "Category",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red)),
                              ],
                            ),

                            const Gap(8),
                            CustomCategoryDropdown(
                              selectedValue: selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              },
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Gap(20),
                                Text(
                                  "Subject",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            Gap(8),
                            Container(
                              width: 295,
                              height: 39,
                              decoration: BoxDecoration(
                                color: AppColors.cannotedit,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFF9FAFB),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.25),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: TextField(
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                  ),
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "e.g. Cannot access courses materials",
                                  hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: AppColors.textLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
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
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            Gap(8),
                            Container(
                              width: 295,
                              height: 153,
                              decoration: BoxDecoration(
                                color: AppColors.cannotedit,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFF9FAFB),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.25),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: TextField(
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                expands: true,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "Please explain in detail what \nhappened, what you tried, any\nerror messages, etc.",
                                  hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: AppColors.textLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    16,
                                    12,
                                    16,
                                    12,
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
                                    width: 295,
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
                                        backgroundColor: const Color(
                                          0xFFFF6900,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(10),
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
                      Gap(30),
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
