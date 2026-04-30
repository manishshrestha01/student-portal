import 'package:codeit_app/model/courses_model.dart';
import 'package:codeit_app/view/course_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesWidget extends StatefulWidget {
  final Datum item;
  const CoursesWidget({super.key, required this.item});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive breakpoints
        final double screenWidth = constraints.maxWidth;
        final bool isSmall = screenWidth < 390;
        final bool isMedium = screenWidth >= 390 && screenWidth < 768;

        // Responsive values
        final double buttonHeight = isSmall ? 44 : (isMedium ? 50 : 50);
        final double buttonFontSize = isSmall ? 14 : (isMedium ? 20 : 20);
        return Column(
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
                              "${widget.item.courseImage}",
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
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${widget.item.status}",
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.item.courseName}",
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
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
                                "${widget.item.mentorName}",
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
                                "${widget.item.lessons} Lesson",
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
                                "${widget.item.duration}",
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
                              onPressed: () => Get.offAll(() => CourseVideo(item: widget.item)),
                              icon: SvgPicture.asset(
                                'assets/support/play.svg',
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFFF6900),
                                  BlendMode.srcIn,
                                ),
                                width: isSmall ? 20 : (isMedium ? 22 : 26),
                                height: isSmall ? 20 : (isMedium ? 22 : 26),
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
                                backgroundColor: const Color(0xFFFFFFFF),
                                side: const BorderSide(
                                  color: Color(0xFFFF6900),
                                  width: 1,
                                ),
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
