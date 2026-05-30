import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/courses_model.dart';
import 'package:codeit_app/view/course_video.dart';
import 'package:codeit_app/utils/status_mapper.dart';
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
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.boxColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 2,
                    // offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 191,
                    color: Colors.transparent,
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
                                color: widget.item.status?.toLowerCase() == 'pending'
                                  ? const Color(0xFFfff9c2)
                                  : const Color(0xFFdcfce6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              StatusMapper.mapCourseStatus(widget.item.status),
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: widget.item.status?.toLowerCase() == 'pending'
                                      ? const Color(0xFF894b00)
                                      : const Color(0xFF016630),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
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
                  Padding(
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
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Gap(6),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/support/mentor.svg',
                              width: 22,
                              height: 22,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: Text(
                                "${widget.item.mentorName}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.0,
                                    letterSpacing: 0,
                                  ),
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
                              width: 18,
                              height: 18,
                              colorFilter: const ColorFilter.mode(
                                 AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap(11),
                            Text(
                              "${widget.item.lessons} Lessons",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              'assets/support/time.svg',
                              width: 18,
                              height: 18,
                              colorFilter: const ColorFilter.mode(
                                 AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap(11),
                            Text(
                              "${widget.item.duration}",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(26),
                        // Show pending message or watch button based on status
                        widget.item.status?.toLowerCase() == 'pending'
                            ? Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF6FF),
                                  border: Border(
                                    left: BorderSide(
                                      color: const Color(0xFF3B82F6),
                                      width: 4,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF3B82F6),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'i',
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(12),
                                    Expanded(
                                      child: Text(
                                        'Your enrollment is being processed. We\'ll notify you once approved.',
                                        style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                            color: const Color(0xFF1447e5),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: buttonHeight,
                                child: ElevatedButton.icon(
                                  onPressed: () => Get.offAll(() => CourseVideo(item: widget.item)),
                                  icon: SvgPicture.asset(
                                    'assets/support/play.svg',
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.primary,
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
                                        color: AppColors.primary,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    side: const BorderSide(
                                      color: AppColors.primary,
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
