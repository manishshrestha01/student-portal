import 'package:codeit_app/controller/courses_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/widgets/courses_widget.dart';
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
  final CoursesController courseController = Get.find<CoursesController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      courseController.getCourses();
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
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;

          // Responsive values
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
          final double verticalGap = isSmall ? 24 : (isMedium ? 28 : 32);
          final double titleFontSize = isSmall ? 20 : (isMedium ? 22 : 25);
          return RefreshIndicator(
            onRefresh: () async {
              await courseController.getCourses();
            },
            child: Obx(() {
              if (courseController.isLoading.value) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
                  ),
                );
              }
              final coursesList = courseController.courses.value.data;
              print("Courses Count: ${coursesList.length}");
              if (coursesList.isEmpty) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: const Center(child: Text("No courses found.")),
                  ),
                );
              }
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Gap(verticalGap),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _buildBreadcrumb(isSmall),
                      ),
                      Gap(verticalGap),
                      Text(
                        'My Courses',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: AppColors.textDark,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Gap(verticalGap),
                      ...coursesList.map((item) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: horizontalPadding),
                          child: CoursesWidget(item: item),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildBreadcrumb(bool isSmall) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
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
          'My Courses',
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
