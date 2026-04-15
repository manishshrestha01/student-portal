import 'dart:math' as math;

import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/terms_controller.dart';
import 'support_view.dart';

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  final TermsController termsController = Get.find<TermsController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      termsController.getTerms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Obx(() {
        if (termsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            return _buildPageContent(constraints.maxWidth);
          },
        );
      }),
    );
  }

  //responsive
  Widget _buildPageContent(double screenWidth) {
    final bool isSmall = screenWidth < 390;
    final bool isMedium = screenWidth >= 390 && screenWidth < 768;
    final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
    final double contentWidth = math.min(
      screenWidth - (horizontalPadding * 2),
      620,
    );
    final String content = (termsController.terms.value.data ?? '').trim();
    //data
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
              'Terms & Conditions',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.textDark,
                  fontSize: isSmall ? 22 : 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(isSmall ? 20 : 30),
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
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.50),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: content.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'No terms available.',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.textDark,
                              fontSize: isSmall ? 14 : 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : HtmlWidget(
                        content,
                        textStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: AppColors.textDark,
                            fontSize: isSmall ? 13 : 15,
                            height: 1.6,
                          ),
                        ),
                      ),
              ),
            ),
            Gap(isSmall ? 28 : 36),
          ],
        ),
      ),
    );
  }

  //routing
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
          'Terms & Conditions',
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
