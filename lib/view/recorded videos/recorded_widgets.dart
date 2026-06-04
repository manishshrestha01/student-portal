import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/recorded%20videos/index_model.dart';
import 'package:codeit_app/view/recorded%20videos/purchase.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordedWidgets extends StatefulWidget {
  const RecordedWidgets({super.key, required this.item});

  final Datum item;

  @override
  State<RecordedWidgets> createState() => _RecordedWidgetsState();
}

class _RecordedWidgetsState extends State<RecordedWidgets> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final bool isSmallDevice = screenWidth < 430;
    final double cardPadding = isSmallDevice ? 16 : 20;
    final double priceFontSize = isSmallDevice ? 22 : 24;
    final double buttonHorizontalPadding = isSmallDevice ? 14 : 20;
    final double buttonFontSize = isSmallDevice ? 15 : 16;
    final double imageAspectRatio = isSmallDevice ? 16 / 10 : 16 / 8.6;
    final plan = widget.item.plans.isNotEmpty ? widget.item.plans.first : null;
    final priceLabel = plan?.price != null ? 'Rs. ${plan!.price}' : 'Price unavailable';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
                    "${widget.item.thumbnail}",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              // Positioned(
              //   bottom: 12,
              //   right: 12,
              //   child: ClipRRect(
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 15,
              //         vertical: 5,
              //       ),
              //       decoration: BoxDecoration(
              //         color: Colors.black,
              //         borderRadius: BorderRadius.circular(20
              //         ),
              //       ),
              //       child: Row(
              //         children: [
              //           Text(
              //             "Duration",
              //             style: GoogleFonts.inter(
              //               textStyle: const TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.item.name}",
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
                Gap(8),
                Text(
                  "${widget.item.subHeading}",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(8),
                Divider(color: const Color(0xFFe2e8f0), thickness: 1),
                const Gap(4),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          priceLabel,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: priceFontSize,
                            ),
                          ),
                        ),
                        //   Row(
                        //     children: [
                        //       Text(
                        //         'Rs. ${widget.item.plans[0].price}',
                        //         style: GoogleFonts.inter(
                        //           textStyle: const TextStyle(
                        //             color: Color(0xFF6a7282),
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 15,
                        //             decoration: TextDecoration.lineThrough,
                        //             decorationColor: Color(0xFF6a7282),
                        //             decorationThickness: 1,
                        //           ),
                        //         ),
                        //       ),
                        //       const Gap(8),
                        //       Container(
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 8,
                        //           vertical: 4,
                        //         ),
                        //         decoration: BoxDecoration(
                        //           color: const Color(0xFFdcfce6),
                        //           borderRadius: BorderRadius.circular(4),
                        //         ),
                        //         child: Text(
                        //           '50% off',
                        //           style: GoogleFonts.inter(
                        //             textStyle: const TextStyle(
                        //               color: Color(0xFF008236),
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 12,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        //
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: widget.item.slug == null || widget.item.slug!.isEmpty
                          ? null
                          : () {
                              final planName = plan?.name ?? 'N/A';
                              final planPrice = plan?.price != null ? 'Rs. ${plan!.price}' : 'N/A';
                              print('courseName: ${widget.item.name}, slug: ${widget.item.slug}, plan: $planName, price: $planPrice');
                              Get.to(
                                () => const Purchase(),
                                arguments: {'slug': widget.item.slug},
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
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
                            'Purchase Now',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: buttonFontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
