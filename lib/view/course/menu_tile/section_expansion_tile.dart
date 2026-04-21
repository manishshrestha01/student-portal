import 'package:flutter/material.dart';
import 'package:codeit_app/view/course/menu_tile/course_section.dart';

class SectionExpansionTile extends StatelessWidget {
  final CourseSection section;

  const SectionExpansionTile({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: Colors.orange,
          child: Text(
            section.number.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        title: Text(section.title),
        children: section.lessons
            .map(
              (lesson) => ListTile(
                dense: true,
                leading: const Icon(
                  Icons.check,
                  color: Colors.orange,
                  size: 18,
                ),
                title: Text(lesson),
              ),
            )
            .toList(),
      ),
    );
  }
}
