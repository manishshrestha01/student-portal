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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9fafb),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);

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
                            color: Color(0xFFf85604),
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
                          color: const Color(0xFF717787),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  Center(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.network(
                                  'https://codeit.com.np/storage/course-featured/01KN8W6S1JY5C5X6H9JBHSKW48.webp',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                left: 10,
                                child: ClipRRect(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF65505),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "🎯 Starts in 4 days",
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Graphic Design (Photoshop)',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Gap(16),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 18,
                                      color: Color(0xFF99a1af),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Starts:',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      'May 25, 2026',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.tv,
                                      size: 18,
                                      color: Color(0xFF99a1af),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Mode:',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      'Online',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      '(Google Meet)',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF6a7282),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const Gap(6),
                                    Image.network(
                                      'https://codeit.com.np/images/google_meet.png',
                                      height: 16,
                                      width: 16,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.hourglass_bottom,
                                      size: 18,
                                      color: Color(0xFF99a1af),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Duration:',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      '1 Month',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      size: 18,
                                      color: Color(0xFF99a1af),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Class Time:',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      '8:00 - 9:30 pm',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF4a5565),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(12),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.groups,
                                      size: 23,
                                      color: Color(0xFFF65505),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Only 2 seats left',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Color(0xFFF65505),
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Divider(
                                  color: const Color(0xFFe2e8f0),
                                  thickness: 1,
                                ),
                                const Gap(8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rs. 3,500',
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              letterSpacing: -0.5,
                                            ),
                                          ),
                                        ),
                                        const Gap(4),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs. 30,000',
                                              style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                                  color: Color(0xFF6a7282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  letterSpacing: -1,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                            ),
                                            const Gap(8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFdcfce6),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '88% off',
                                                style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                    color: Color(0xFF008236),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFF65505,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Enroll Now',
                                            style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          const Gap(6),
                                          const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Divider(
                                  color: const Color(0xFFe2e8f0),
                                  thickness: 1,
                                ),
                                const Gap(8),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.snackbar(
                                        'Demo Video',
                                        'Opening demo video...',
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/support/play.svg',
                                          width: 24,
                                          height: 24,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xFFf85604),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        const Gap(8),
                                        Text(
                                          'Watch Demo Video',
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: Color(0xFFf85604),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
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
                    ),
                  ),
                  Gap(30)
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
          'Upcoming Classes',
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
