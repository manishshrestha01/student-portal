import 'package:flutter/material.dart';
import 'package:codeit_app/view/course/course_detail_view.dart';
import 'package:gap/gap.dart';

class CourseCard extends StatelessWidget {
  final Image courseImage;
  final String courseName;
  final String courseTutor;
  final int lessonCount;
  final int courseDuration;

  const CourseCard({
    super.key,
    required this.courseImage,
    required this.courseName,
    required this.courseTutor,
    required this.lessonCount,
    required this.courseDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        width: double.infinity,
        child: Column(
          children: [
            // Top Banner
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1E2A5A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  courseImage,
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Enrolled",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Course Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const Gap(6),

                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 5),
                      Text(courseTutor),
                    ],
                  ),

                  const Gap(10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.play_circle_fill, size: 18),
                          Gap(5),
                          Text("$lessonCount Lesson"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18),
                          Gap(5),
                          Text("$courseDuration Days"),
                        ],
                      ),
                    ],
                  ),

                  const Gap(14),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CourseDetailView(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.play_arrow, color: Colors.orange),
                      label: const Text(
                        "Watch Recorded Video",
                        style: TextStyle(color: Colors.orange),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
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
