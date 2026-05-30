import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/controller/upcoming%20course/upcoming_controller.dart';
import 'package:codeit_app/model/upcoming%20course/upcoming_model.dart';
import 'package:codeit_app/view/upcoming%20course/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingWidget extends StatefulWidget {
  final Datum item;
  const UpcomingWidget({super.key, required this.item});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final bool isSmallDevice = screenWidth < 430;
    final double cardPadding = isSmallDevice ? 16 : 20;
    final double detailFontSize = isSmallDevice ? 13 : 14;
    final double priceFontSize = isSmallDevice ? 22 : 24;
    final double oldPriceFontSize = isSmallDevice ? 13 : 15;
    final double buttonHorizontalPadding = isSmallDevice ? 14 : 20;
    final double buttonFontSize = isSmallDevice ? 15 : 16;
    final double imageAspectRatio = isSmallDevice ? 16 / 10 : 16 / 8.6;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: imageAspectRatio,
                  child: Image.network(
                    "${widget.item.courseImage}",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 0,
                child: ClipRRect(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "🎯 ${widget.item.startsIn}",
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
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.item.courseName}',
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
                const Gap(8),
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
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '${widget.item.startDate}',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w600,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    const Icon(Icons.tv, size: 18, color: Color(0xFF99a1af)),
                    const Gap(8),
                    Text(
                      'Mode:',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'Online',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w600,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '(Google Meet)',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
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
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '${widget.item.courseDuration}',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
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
                        textStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '${widget.item.classTime}',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Color(0xFF4a5565),
                          fontWeight: FontWeight.w500,
                          fontSize: detailFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    const Icon(
                      Icons.groups,
                      size: 23,
                      color: AppColors.orangeAccent,
                    ),
                    const Gap(8),
                    Text(
                      '${widget.item.availableSeats}',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: AppColors.orangeAccent,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(4),
                Divider(color: const Color(0xFFe2e8f0), thickness: 1),
                const Gap(4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rs. ${widget.item.offerPrice}',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.w700,
                              fontSize: priceFontSize,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Rs. ${widget.item.actualPrice}',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.w500,
                                  fontSize: oldPriceFontSize,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.textMuted,
                                  decorationThickness: 1,
                                ),
                              ),
                            ),
                            const Gap(8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFdcfce6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${widget.item.discount} off',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    color: const Color(0xFF008236),
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
                      onPressed: () {
                        final upcomingController =
                            Get.find<UpcomingController>();
                        upcomingController.selectCourse(widget.item);

                        Get.offAll(() => const Checkout());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: buttonHorizontalPadding,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Enroll Now',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: buttonFontSize,
                              ),
                            ),
                          ),
                          const Gap(6),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                if (widget.item.demoVideoId != null &&
                    widget.item.demoVideoId!.isNotEmpty) ...[
                  Divider(color: const Color(0xFFe2e8f0), thickness: 1),
                  const Gap(8),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final videoId = widget.item.demoVideoId ?? '';
                        if (videoId.isNotEmpty) {
                          final youtubeUrl =
                              'https://www.youtube.com/watch?v=$videoId';
                          await launchUrl(Uri.parse(youtubeUrl));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/support/play.svg',
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'Watch Demo Video',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: AppColors.primary,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
