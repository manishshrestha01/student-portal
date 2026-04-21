import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:codeit_app/widgets/app_header_widget.dart';
import 'package:codeit_app/widgets/course_header_widget.dart';
import 'package:codeit_app/view/course/menu_tile/curriculum_screen.dart';
import 'package:codeit_app/view/course/menu_tile/notes_resources_screen.dart';

class CourseDetailView extends StatelessWidget {
  const CourseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppHeader(),

        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseHeader(courseHeader: "Home > My Courses > Class Videos"),
                // Top Banner
                Container(
                  margin: EdgeInsets.all(12),
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E2A5A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "course image",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Menu Tiles
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.menu_book),
                    title: const Text("Curriculum"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CurriculumScreen(),
                        ),
                      );
                    },
                  ),

                  // _menuTile(Icons.menu_book, "Course Curriculum"),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.description),
                    title: Text("Notes & Resources"),
                    trailing: Icon(Icons.arrow_forward_ios),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotesResourcesScreen(),
                        ),
                      );
                    },
                  ),
                  // _menuTile(Icons.description, "Notes & Resources"),
                ),

                // Class Videos Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.videocam_rounded,
                            size: 40,
                            color: const Color.fromARGB(255, 255, 81, 0),
                          ),
                          Gap(10),
                          Text(
                            "Class Videos",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text("asc"),
                      ),
                    ],
                  ),
                ),

                // Class Videos List
                ListView.builder(
                  itemCount: 14,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _videoTile(index + 1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _menuTile(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon),
          Gap(10),
          Expanded(child: Text(title)),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _videoTile(int day) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.play_circle_fill),
          ),
          Gap(10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Web Designing Day $day",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Gap(4),
                Text(
                  "Posted Feb 17, 2024",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
