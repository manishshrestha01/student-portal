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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 2),
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
                child: Image.network(
                  "${widget.item.courseImage}",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                      color: const Color(0xFFf85604),
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
            padding: const EdgeInsets.all(20),
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
                        textStyle: const TextStyle(
                          color: Color(0xFF4a5565),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '${widget.item.startDate}',
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
                    const Icon(Icons.tv, size: 18, color: Color(0xFF99a1af)),
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
                      '${widget.item.courseDuration}',
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
                      '${widget.item.classTime}',
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
                      Icons.groups,
                      size: 23,
                      color: Color(0xFFF65505),
                    ),
                    const Gap(8),
                    Text(
                      '${widget.item.availableSeats}',
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
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Rs. ${widget.item.actualPrice}',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  color: Color(0xFF6a7282),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: -1,
                                  decoration: TextDecoration.lineThrough,
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
                      onPressed: () => Get.offAll(() => const Checkout()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF65505),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
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
                if (widget.item.demoVideoId != null && widget.item.demoVideoId!.isNotEmpty) ...[
                  Divider(color: const Color(0xFFe2e8f0), thickness: 1),
                  const Gap(8),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final videoId = widget.item.demoVideoId ?? '';
                        if (videoId.isNotEmpty) {
                          final youtubeUrl = 'https://www.youtube.com/watch?v=$videoId';
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
