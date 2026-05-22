import 'package:codeit_app/controller/email_certificates_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/certificates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificatesWidget extends StatelessWidget {
  final Datum item;
  const CertificatesWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EmailCertificatesController>();
    
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive breakpoints
        final double screenWidth = constraints.maxWidth;
        final bool isSmall = screenWidth < 390;
        final bool isMedium = screenWidth >= 390 && screenWidth < 768;
        
        // Responsive values
        final double padding = isSmall ? 16 : (isMedium ? 18 : 20);
        final double gapSize = isSmall ? 8 : 9;
        final double iconSize = isSmall ? 32 : 40;
        final double iconSizeSmall = isSmall ? 20 : (isMedium ? 25 : 35);
        final double titleFontSize = isSmall ? 14 : (isMedium ? 16 : 17);
        final double labelFontSize = isSmall ? 12 : (isMedium ? 14 : 17);
        final double buttonHeight = isSmall ? 44 : (isMedium ? 50 : 50);
        final double buttonFontSize = isSmall ? 14 : (isMedium ? 20 : 20);
        final double borderRadius = isSmall ? 16 : 20;
        
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(64),
                blurRadius: 2,
                // offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title Row
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/support/certificate_frame.svg',
                    width: iconSize,
                    height: iconSize,
                    colorFilter: const ColorFilter.mode(
                      // Color(0xFF9A1CB9), /purple in dashboard
                      Color(0xFFFF6900), // orange in ui
                      BlendMode.srcIn,
                    ),
                  ),
                  Gap(gapSize),
                  Expanded(
                    child: Text(
                      "${item.courseName}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.textDark,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(padding * 0.5),
              const Divider(thickness: 1, color: Colors.black),
              Gap(padding),
              
              // Issued To Row
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/support/issued.svg',
                    width: iconSizeSmall,
                    height: iconSizeSmall,
                    colorFilter: const ColorFilter.mode(
                      Color(0xB3000000),
                      BlendMode.srcIn,
                    ),
                  ),
                  Gap(gapSize * 1.5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Issued to',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: const Color(0xB3000000),
                              fontSize: labelFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '${item.issuedTo}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontSize: labelFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(padding * 0.5),
              
              // Date Completed Row
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/support/date.svg',
                    width: iconSizeSmall,
                    height: iconSizeSmall,
                    colorFilter: const ColorFilter.mode(
                      Color(0xB3000000),
                      BlendMode.srcIn,
                    ),
                  ),
                  Gap(gapSize * 0.8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Completed',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: const Color(0xB3000000),
                              fontSize: labelFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '${item.courseCompletionDate}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontSize: labelFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(padding * 1.3),
              
              // Email Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton.icon(
                    onPressed: controller.isLoadingForId(item.certificateId.toString())
                        ? null
                        : () => controller.sendEmail(item.certificateId.toString()),
                    icon: SvgPicture.asset(
                      'assets/support/download.svg',
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFFF6900),
                        BlendMode.srcIn,
                      ),
                      width: isSmall ? 20 : (isMedium ? 22 : 26),
                      height: isSmall ? 20 : (isMedium ? 22 : 26),
                    ),
                    label: Text(
                      controller.isLoadingForId(item.certificateId.toString())
                          ? 'Sending...'
                          : 'Email Certificate',
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
                      side: const BorderSide(color: Color(0xFFFF6900), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}