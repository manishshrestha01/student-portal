import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/controller/recorded%20videos/recorded_controller.dart';
import 'package:codeit_app/view/recorded%20videos/recorded_widgets.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_view.dart';

class RecordedVideosView extends StatefulWidget {
  const RecordedVideosView({super.key});

  @override
  State<RecordedVideosView> createState() => _RecordedVideosViewState();
}

class _RecordedVideosViewState extends State<RecordedVideosView> {
  final RecordedController recordedController = Get.find<RecordedController>();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recordedController.getRecordedVideos();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);

          return RefreshIndicator(
            onRefresh: () async {
              await recordedController.getRecordedVideos();
            },
            child: Obx(() {
              if (recordedController.isLoading.value) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
                  ),
                );
              }
              final recordedList = recordedController.recordedVideos.toList();
              final displayedList = _searchQuery.isEmpty
                  ? recordedList
                  : recordedList.where((item) {
                      final query = _searchQuery.toLowerCase();
                      return (item.name ?? '').toLowerCase().contains(query) ||
                          (item.slug ?? '').toLowerCase().contains(query) ||
                          (item.subHeading ?? '').toLowerCase().contains(query);
                    }).toList();
              print("Recorded Count: ${recordedList.length}");
              if (recordedController.errorMessage.value.isNotEmpty) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: Center(child: Text(recordedController.errorMessage.value)),
                  ),
                );
              }
              if (recordedList.isEmpty) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: const Center(child: Text("No recorded videos found.")),
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
                            'Learn Anytime, Anywhere',
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
                              const TextSpan(text: "Code IT Recorded Videos"),
                            ],
                          ),
                        ),
                      ),
                      Gap(15),
                      Center(
                        child: Text(
                          "Access 500+ hours of premium recorded content. Watch anytime, rewind, and learn at your own pace with our comprehensive video library.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      SearchBar(
                        controller: _searchController,
                        hintText: 'Search by course name',
                        hintStyle: WidgetStateProperty.all(
                          const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // onChanged: (value) {
                        //   setState(() {
                        //     _searchQuery = value.trim();
                        //   });
                        // },
                        onSubmitted: (value) {
                          setState(() {
                            _searchQuery = value.trim();
                          });
                          FocusScope.of(context).unfocus();
                        },
                        onTapOutside: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        leading: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _searchQuery = _searchController.text.trim();
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(Icons.search, color: AppColors.orangeAccent),
                        ),
                        trailing: [
                          IconButton(
                            icon: const Icon(Icons.close_rounded),
                            color: AppColors.iconMuted,
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          ),
                        ],
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shadowColor: WidgetStateProperty.all(AppColors.shadow),
                        elevation: WidgetStateProperty.all(4),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: AppColors.shadow, width: 0.5),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                      Gap(20),
                      if (displayedList.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Center(
                            child: Text(
                              _searchQuery.isEmpty
                                  ? 'No recorded videos found.'
                                  : 'No recorded videos match your search.',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ...() {
                        int crossAxisCount = 1;
                        if (screenWidth >= 1100) {
                          crossAxisCount = 3;
                        } else if (screenWidth >= 700) {
                          crossAxisCount = 2;
                        }

                        final rows = <Widget>[];
                        for (int i = 0; i < displayedList.length; i += crossAxisCount) {
                          final chunk = displayedList.skip(i).take(crossAxisCount).toList();
                          rows.add(
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int j = 0; j < chunk.length; j++) ...[
                                    Expanded(
                                      child: RecordedWidgets(item: chunk[j]),
                                    ),
                                    if (j < chunk.length - 1) const Gap(20),
                                  ],
                                  // Add empty placeholders to keep grid alignment uniform
                                  for (int j = chunk.length; j < crossAxisCount; j++) ...[
                                    const Expanded(child: SizedBox.shrink()),
                                    if (j < crossAxisCount - 1) const Gap(20),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }
                        return rows;
                      }(),
                      Gap(30),
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
          'Recorded Videos',
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
