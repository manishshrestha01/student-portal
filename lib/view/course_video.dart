import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/curriculum.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/note.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseVideo extends StatefulWidget {
  const CourseVideo({super.key});

  @override
  State<CourseVideo> createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> {
  // Logic: true = Ascending (1 to 14), false = Descending (14 to 1)
  bool isAscending = true;
  final List<int> videoDays = List.generate(14, (index) => index + 1);

  // Method to handle sorting
  void toggleSort() {
    setState(() {
      isAscending = !isAscending;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    List<int> sortedList = isAscending
        ? List.from(videoDays)
        : videoDays.reversed.toList();
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

          return SafeArea(
            child: SingleChildScrollView(
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
                            'https://codeit.com.np/storage/course-featured/01KN8VDNPJP4QJBSVQNHEMXCC4.webp',
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                        Gap(14),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Curriculum());
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
                                  'assets/support/course.svg',
                                  width: 26,
                                  height: 26,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap(10),
                                Text(
                                  "Course Curriculum",
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
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Note());
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
                          height: 1520,
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
                                  // Sort Button Interaction
                                  GestureDetector(
                                    onTap: toggleSort,
                                    child: SortButton(isAscending: isAscending),
                                  ),
                                ],
                              ),
                              Gap(15),
                              Divider(height: 1,thickness: 0.5, color: Colors.black),
                              Expanded(
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return videoItem(sortedList[index]);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        height: 1,
                                        color: Colors.black,
                                        thickness: 0.5,
                                      ),
                                  itemCount: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// individual video row item
Widget videoItem(int day) {
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
                "Web Designing Day $day",
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
                    "Posted Feb 17, 2024",
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

// Sort button widget
class SortButton extends StatelessWidget {
  final bool isAscending;
  const SortButton({super.key, required this.isAscending});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71,
      height: 26,
      padding: const EdgeInsets.only(top: 1, bottom: 2, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.7)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Spacer(),
          Text(
            isAscending ? "asc" : "desc",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(0, 0, 0, 0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Transform.rotate(
            angle: 1.5708,
            child: Icon(
              Icons.chevron_right,
              color: Color.fromRGBO(0, 0, 0, 0.7),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
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
