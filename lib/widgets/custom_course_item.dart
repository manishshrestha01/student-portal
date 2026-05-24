import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCourseItem extends StatelessWidget {
  final String title;
  final String mentor;
  final String videos;
  final String image;
  final VoidCallback? onTap;

  const CustomCourseItem({
    super.key,
    required this.title,
    required this.mentor,
    required this.videos,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 108,
                width: 97,
                child: Image.network(
                  image,
                  height: 108,
                  width: 97,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(width: 30),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                       color: AppColors.textDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Mentor: $mentor",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.play_circle,
                        size: 18,
                        color: Color(0xFFf85604),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "$videos Videos",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
