import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCoursesPage(),
    );
  }
}

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Row(
          children: const [
            Text(
              "CODE",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "IT",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.person, color: Colors.white, size: 16),
                SizedBox(width: 5),
                Text("Name", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Header
            Row(
              children: const [
                Icon(Icons.home, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text("Home > My Courses", style: TextStyle(color: Colors.grey)),
              ],
            ),

            const Gap(15),

            // 🔹 Title
            const Text(
              "My Courses",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const Gap(15),

            // 🔹 Course Card
            const CourseCard(),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          // Top Banner
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF1E2A5A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Stack(
              children: [
                // Center Title
                const Center(
                  child: Text(
                    "Web Designing",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),

                // Enrolled Badge
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

          // Bottom Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Web Design",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 6),

                // Instructor
                const Row(
                  children: [
                    Icon(Icons.person, size: 16),
                    SizedBox(width: 5),
                    Text("Er. Sajal Shrestha"),
                  ],
                ),

                const Gap(10),

                // Lessons & Duration
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.play_circle_fill, size: 18),
                        SizedBox(width: 5),
                        Text("16 Lesson"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 18),
                        SizedBox(width: 5),
                        Text("14 Days"),
                      ],
                    ),
                  ],
                ),

                const Gap(14),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
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
    );
  }
}
