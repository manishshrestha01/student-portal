import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Mentor: $mentor",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.play_circle,
                        size: 16,
                        color: Colors.black87,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "$videos Videos",
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
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
