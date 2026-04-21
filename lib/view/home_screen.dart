import 'package:flutter/material.dart';
import 'package:codeit_app/view/receipt/receipts_screen.dart';
import 'package:codeit_app/view/course/my_courses_view.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("My Courses"),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyCoursesView()),
                );
              },
            ),
          ),
          Gap(10),
          Center(
            child: ElevatedButton(
              child: const Text("Payment Receipts"),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReceiptsScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
