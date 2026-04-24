import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/certificates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificatesWidget extends StatelessWidget {
  final Datum item;
  const CertificatesWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
                width: 15.53,
                height: 19.76,
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
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '${item.issuedTo}',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 10,
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
                width: 15.53,
                height: 19.76,
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
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '${item.courseCompletionDate}',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(21),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () async {
                final String? urlPath = item.downloadCertificate;

                if (urlPath == null || urlPath.isEmpty) {
                  _showSnack("Download Error", Colors.red);
                  return;
                }
                _showSnack(
                  "Downloading",
                  const Color(0xFFFF6900),
                );

                try {
                  final Uri url = Uri.parse(urlPath.trim());
                  bool launched = await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );

                  if (launched) {
                    Future.delayed(const Duration(seconds: 1), () {
                      _showSnack(
                        "Download Succeeded",
                        Colors.green,
                      );
                    });
                  } else {
                    _showSnack(
                      "Download Error",
                      Colors.red,
                    );
                  }
                } catch (e) {
                  _showSnack(
                    "Download Error",
                    Colors.red,
                  );
                }
              },
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
                'Download Certificates',
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
        ],
      ),
    );
  }
}
void _showSnack(String title, Color bgColor) {
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }

  Get.snackbar(
    title,
    "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: bgColor,
    colorText: Colors.white,
    margin: const EdgeInsets.all(15),
    duration: const Duration(seconds: 2),
    icon: Icon(
      bgColor == Colors.red ? Icons.error_outline : Icons.download_done_rounded,
      color: Colors.white,
    ),
  );
}