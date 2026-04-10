import 'package:flutter/material.dart';
import 'package:codeit_app/widgets/app_header_widget.dart';
import 'package:codeit_app/widgets/course_header_widget.dart';
import 'package:codeit_app/widgets/course_card_widget.dart';
import 'package:gap/gap.dart';

class MyCoursesView extends StatefulWidget {
  const MyCoursesView({super.key});

  @override
  State<MyCoursesView> createState() => _MyCoursesViewState();
}

class _MyCoursesViewState extends State<MyCoursesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: const AppHeader(),

        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseHeader(courseHeader: "Home > My Courses"),

              Gap(15),

              Text(
                "My Courses",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              Gap(15),

              CourseCard(
                courseImage: Image.network(
                  "https://codeit.com.np/storage/01JJRA9TM148GC7YW7VK2NT3Q0.avif",
                  fit: BoxFit.cover,
                ),
                courseName: "Web Design",
                courseTutor: "Er. Sajal Shrestha",
                lessonCount: 16,
                courseDuration: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
