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
    return Container(
      width: 387,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(64),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/support/certificate_frame.svg',
                width: 40,
                height: 40,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFF6900),
                  BlendMode.srcIn,
                ),
              ),
              Gap(9),
              Text(
                "${item.courseName}",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Gap(10),
          const Divider(thickness: 1, color: Colors.black),
          Gap(20),
          Row(
            children: [
              SvgPicture.asset(
                'assets/support/issued.svg',
                width: 25,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Color(0xB3000000),
                  BlendMode.srcIn,
                ),
              ),
              Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Issued to',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xB3000000),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '${item.issuedTo}',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              SvgPicture.asset(
                'assets/support/date.svg',
                width: 25,
                height: 25,
                colorFilter: const ColorFilter.mode(
                  Color(0xB3000000),
                  BlendMode.srcIn,
                ),
              ),
              Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date Completed',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xB3000000),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '${item.courseCompletionDate}',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(21),
          Obx(()=>SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: controller.isLoadingForId(item.certicateId.toString()) ? null : ()=> controller.sendEmail(item.certicateId.toString()),
                icon: SvgPicture.asset(
                  'assets/support/download.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFFF6900),
                    BlendMode.srcIn,
                  ),
                  width: 26,
                  height: 26,
                ),
                label: Text(
                  controller.isLoadingForId(item.certicateId.toString()) ? 'Sending...' : 'Email Certificate',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: const Color(0xFFFF6900),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFFFF),
                  side: BorderSide(color: const Color(0xFFFF6900), width: 1),
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
  }
}