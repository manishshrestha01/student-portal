import 'package:codeit_app/controller/course_video_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/course_video_model.dart';
import 'package:codeit_app/model/courses_model.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/notes.dart';
import 'package:codeit_app/view/video_player_page.dart';
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
          final double subtitleFontSize = isSmall ? 16 : (isMedium ? 18 : 20);
          final double bodyFontSize = isSmall ? 14 : (isMedium ? 15 : 16);
          final double containerWidth = double.infinity;
          final double imageHeight = isSmall ? 180 : (isMedium ? 220 : 233);
          final double containerHeight = isSmall ? 56 : 66;

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
                        width: containerWidth,
                        height: imageHeight,
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
                          Get.to(() => Notes(id: widget.item.enrollmentId,));
                        },
                        child: Container(
                          width: double.infinity,
                          height: containerHeight,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 2,
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
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: bodyFontSize,
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
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                              blurRadius: 2,
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
                                      fontSize: subtitleFontSize,
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
                              final videosList = List<Video>.from(videos);
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return videoItem(videosList[index], videosList, screenWidth, bodyFontSize, subtitleFontSize);
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
Widget videoItem(Video video, List<Video> allVideos, double screenWidth, double bodyFontSize, double subtitleFontSize) {
  final isSmall = screenWidth < 390;
  final playIconSize = isSmall ? 16.0 : 24.75;
  final playContainerSize = isSmall ? 70.0 : 82.0;
  final playContainerHeight = isSmall ? 60.0 : 72.0;
  final gapSize = isSmall ? 8.0 : 25.0;
  final dateIconSize = isSmall ? 14.0 : 20.0;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: isSmall ? 10 : 15),
    child: GestureDetector(
      onTap: () {
        Get.to(() => VideoPlayerPage(video: video, allVideos: allVideos));
      },
      child: Row(
        children: [
          Container(
            width: playContainerSize,
            height: playContainerHeight,
            padding: EdgeInsets.all(isSmall ? 15 : 25),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              'assets/support/play.svg',
              width: playIconSize,
              height: playIconSize,
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(0, 0, 0, 0.7),
                BlendMode.srcIn,
              ),
            ),
          ),
          Gap(gapSize),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${video.title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ),
                Gap(isSmall ? 4 : 6),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/support/date.svg',
                      width: dateIconSize,
                      height: dateIconSize,
                      colorFilter: const ColorFilter.mode(
                        Color(0xB3000000),
                        BlendMode.srcIn,
                      ),
                    ),
                    Gap(isSmall ? 4 : 9),
                    Expanded(
                      child: Text(
                        "Posted ${video.posted}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                          fontSize: bodyFontSize,
                          fontWeight: FontWeight.w500,
                        ),
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
