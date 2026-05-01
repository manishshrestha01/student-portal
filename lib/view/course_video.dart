import 'package:codeit_app/controller/course_video_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/course_video_model.dart';
import 'package:codeit_app/model/courses_model.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/notes.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseVideo extends StatefulWidget {
  final Datum item;
  const CourseVideo({super.key, required this.item});

  @override
  State<CourseVideo> createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> {
  bool isAscending = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Get.find<CourseVideoController>();
      controller.sendCourseVideo(widget.item.enrollmentId);
    });
  }

  void toggleSort() {
    setState(() {
      isAscending = !isAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CourseVideoController>();
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
                        width: 393,
                        height: 233,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          "${widget.item.courseImage}",
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      Gap(14),
                      // GestureDetector(
                      //   onTap: () {
                      //   },
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: 66,
                      //     padding: EdgeInsets.all(20),
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xFFF9FAFB),
                      //       borderRadius: BorderRadius.circular(10),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: const Color.fromRGBO(0, 0, 0, 0.25),
                      //           offset: Offset(4, 4),
                      //           blurRadius: 4,
                      //           spreadRadius: 0,
                      //         ),
                      //       ],
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         SvgPicture.asset(
                      //           'assets/support/course.svg',
                      //           width: 26,
                      //           height: 26,
                      //           colorFilter: const ColorFilter.mode(
                      //             Colors.black,
                      //             BlendMode.srcIn,
                      //           ),
                      //         ),
                      //         Gap(10),
                      //         Text(
                      //           "Course Curriculum",
                      //           style: GoogleFonts.inter(
                      //             textStyle: const TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w400,
                      //               height: 1.0,
                      //               letterSpacing: 0,
                      //             ),
                      //           ),
                      //         ),
                      //         Spacer(),
                      //         const Icon(
                      //           Icons.chevron_right,
                      //           color: Colors.black,
                      //           size: 20,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Gap(20),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Notes());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 66,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(4, 4),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/support/note.svg',
                                width: 26,
                                height: 26,
                                colorFilter: const ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Gap(10),
                              Text(
                                "Notes & Resources",
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(20),
                      Container(
                        width: 393,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/support/Video.svg',
                                  width: 30.6,
                                  height: 21.6,
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFFFF6900),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap(13),
                                Text(
                                  "Class Videos",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      height: 1.0,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: toggleSort,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      isAscending ? "asc" : "desc",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(15),
                            Divider(height: 1,thickness: 0.5, color: Colors.black),
                            Obx(() {
                              var videos = controller.coursevideo.value.courseDetails?.videos ?? [];
                              if (controller.isLoadingForId(widget.item.enrollmentId.toString())) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              }
                              if (videos.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Center(child: Text("No videos available.")),
                                );
                              }
                              // Sort videos
                              if (!isAscending) {
                                videos = videos.reversed.toList();
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return videoItem(videos[index]);
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      height: 1,
                                      color: Colors.black,
                                      thickness: 0.5,
                                    ),
                                itemCount: videos.length,
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// individual video row item
Widget videoItem(Video video) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        Container(
          width: 82,
          height: 72,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            'assets/support/play.svg',
            width: 24.75,
            height: 24.75,
            colorFilter: const ColorFilter.mode(
              Color.fromRGBO(0, 0, 0, 0.7),
              BlendMode.srcIn,
            ),
          ),
        ),
        Gap(25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${video.title}",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              Gap(0),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/support/date.svg',
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      Color(0xB3000000),
                      BlendMode.srcIn,
                    ),
                  ),
                  Gap(9),
                  Text(
                    "Posted ${video.posted}",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          size: 20,
        ),
      ],
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
      GestureDetector(
        onTap: () => Get.offAll(() => CourseView()),
        child: Row(
          children: [
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
        ),
      ),
      const Icon(
        Icons.chevron_right,
        color: Color.fromRGBO(0, 0, 0, 0.9),
        size: 20,
      ),
      const Gap(7),
      Text(
        'Class Videos',
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
