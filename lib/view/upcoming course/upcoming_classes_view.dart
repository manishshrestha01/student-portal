import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/controller/upcoming%20course/upcoming_controller.dart';
import 'package:codeit_app/view/upcoming%20course/upcoming_widget.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_view.dart';

class UpcomingClassesView extends StatefulWidget {
  const UpcomingClassesView({super.key});

  @override
  State<UpcomingClassesView> createState() => _UpcomingClassesViewState();
}

class _UpcomingClassesViewState extends State<UpcomingClassesView> {
  final UpcomingController upcomingController = Get.find<UpcomingController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      upcomingController.getUpcomingClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 430;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);

          return Obx(() {
            if (upcomingController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            final upcomingList = upcomingController.upcomingclass.value.data;
            if (upcomingList.isEmpty) {
              return const Center(child: Text("No upcoming classes found."));
            }
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
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFffeee8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFfed1c0),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Next Batches Starting Soon',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              height: 1.2,
                            ),
                          ),
                          children: [
                            const TextSpan(
                              text: "Upcoming Classes in Google Meet ",
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image.network(
                                'https://codeit.com.np/images/google_meet.png',
                                height: 36,
                                width: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(15),
                    Center(
                      child: Text(
                        "Miss a live class? No problem—recorded videos will be available for every session.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                    Gap(20),
                    ...upcomingList.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: UpcomingWidget(item: item),
                      );
                    }),
                    Gap(30),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildBreadcrumb(bool isSmall) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              const Gap(8),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: AppColors.textMuted,
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
          color: AppColors.iconMuted,
          size: isSmall ? 18 : 20,
        ),
        const Gap(7),
        Text(
          'Upcoming Classes',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: isSmall ? 13 : 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
