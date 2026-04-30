import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/course_video.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;

          // Responsive values
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
          final double verticalGap = isSmall ? 24 : (isMedium ? 28 : 32);
          final double titleFontSize = isSmall ? 20 : (isMedium ? 22 : 25);
          final double breadcrumbFontSize = isSmall ? 12 : (isMedium ? 13 : 15);
          final double buttonHeight = isSmall ? 44 : (isMedium ? 50 : 50);
          final double buttonFontSize = isSmall ? 14 : (isMedium ? 20 : 20);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(verticalGap),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildBreadcrumb(breadcrumbFontSize),
                  ),
                  Gap(verticalGap),
                  Text(
                    'My Courses',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap(verticalGap),
                  Column(
                    children: [
                      Container(
                        width: 390,
                        height: 394,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: double.infinity,
                                height: 191,
                                color: Colors.blue,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.network(
                                        "https://codeit.com.np/storage/course-featured/01KN8VDNPJP4QJBSVQNHEMXCC4.webp",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      right: 15,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFF6900),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          "Enrolled",
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              height: 1.0,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Gap(20),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsetsGeometry.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Web Design",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                    Gap(6),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/support/mentor.svg',
                                          width: 24,
                                          height: 24,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.black,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap(13),
                                        Text(
                                          "Er. Sajal Shrestha",
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              height: 1.0,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(8),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/support/play.svg',
                                          width: 28,
                                          height: 28,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.black,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap(11),
                                        Text(
                                          "16 Lesson",
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              height: 1.0,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                          'assets/support/time.svg',
                                          width: 24,
                                          height: 24,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.black,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap(11),
                                        Text(
                                          "14 Days",
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              height: 1.0,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(26),
                                    //button
                                    SizedBox(
                                      width: double.infinity,
                                      height: buttonHeight,
                                      child: ElevatedButton.icon(
                                        onPressed: () => Get.offAll(() => CourseVideo()),
                                        icon: SvgPicture.asset(
                                          'assets/support/play.svg',
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xFFFF6900),
                                            BlendMode.srcIn,
                                          ),
                                          width: isSmall
                                              ? 20
                                              : (isMedium ? 22 : 26),
                                          height: isSmall
                                              ? 20
                                              : (isMedium ? 22 : 26),
                                        ),
                                        label: Text(
                                          'Watch Recorded Video',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                              color: const Color(0xFFFF6900),
                                              fontSize: buttonFontSize,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFFFFFFFF,
                                          ),
                                          side: const BorderSide(
                                            color: Color(0xFFFF6900),
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
        },
      ),
    );
  }

  Widget _buildBreadcrumb(double fontSize) {
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
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(7),
        const Icon(
          Icons.chevron_right,
          color: Color.fromRGBO(0, 0, 0, 0.9),
          size: 20,
        ),
        const Gap(7),
        Text(
          'My Courses',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color(0xFF000000),
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
