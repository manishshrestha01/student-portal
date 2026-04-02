import 'dart:math' as math;

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
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(title: const Text('CODEIT')),
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
                  Text(
                    'Suggestions',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontSize: isSmall ? 22 : 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap(isSmall ? 20 : 32),
                  Center(
                    child: Container(
                      width: contentWidth,
                      padding: EdgeInsets.fromLTRB(
                        isSmall ? 12 : 18,
                        14,
                        isSmall ? 12 : 18,
                        20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Help Us Improve Our Online Class',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: isSmall ? 18 : 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const Gap(6),
                          Center(
                            child: Text(
                              'Do you have any suggestions for improving our online classes?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: isSmall ? 14 : 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          const Gap(18),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/support/message.svg',
                                width: 22,
                                height: 20.62,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFFF6900),
                                  BlendMode.srcIn,
                                ),
                              ),
                              const Gap(10),
                              Text(
                                'Your Suggestion',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontSize: isSmall ? 16 : 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          SizedBox(
                            width: double.infinity,
                            height: isSmall ? 180 : 156,
                            child: TextField(
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              textAlignVertical: TextAlignVertical.top,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: const Color(0xFF000000),
                                  fontSize: isSmall ? 14 : 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              decoration: InputDecoration(
                                hintText: 'We\'d love to hear your ideas.....',
                                hintStyle: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: isSmall ? 14 : 16,
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
                          const Gap(20),
                          SizedBox(
                            width: double.infinity,
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
                                'Submit Ticket',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: AppColors.boxColor,
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
                        ],
                      ),
                    ),
                  ),
                  Gap(isSmall ? 28 : 36),
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
          onTap: () => Get.offAll(() => const SupportView()),
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
          'Suggestions',
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
}
