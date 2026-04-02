import 'dart:math' as math;

import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/counseling_view.dart';
import 'package:codeit_app/views/general_view.dart';
import 'package:codeit_app/views/internship_view.dart';
import 'package:codeit_app/views/suggestions_view.dart';
import 'package:codeit_app/views/technical_view.dart';
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
          final double cardHeight = isSmall ? 278 : 252;
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
                            fontSize: isSmall ? 22 : 25,
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
                        onPressed: () {},
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
