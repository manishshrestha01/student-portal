import 'package:codeit_app/controller/link_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkView extends StatefulWidget {
  const LinkView({super.key});

  @override
  State<LinkView> createState() => _LinkViewState();
}

class _LinkViewState extends State<LinkView> {
  final LinkController linkController = Get.find<LinkController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      linkController.getLinks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final linksList = linkController.link.value.data;
      print("links Count: ${linksList.length}");
      if (linksList.isEmpty) {
        return const SizedBox.shrink();
      }

      final item = linksList.first;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFFFFFFF)),
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
          children: [
            Text(
              "${item.courseName}",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "${item.mentorName}",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: const Color(0xFF4a5565),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "Class Time: ${item.classTime}",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00a63e),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Join Live Class",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: AppColors.boxColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
