import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CourseHeader extends StatelessWidget {
  final String courseHeader;
  const CourseHeader({super.key, required this.courseHeader});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(Icons.home, size: 16), Gap(5), Text(courseHeader)],
    );
  }
}
