import 'package:flutter/material.dart';
import 'package:codeit_app/view/course/menu_tile/curriculum_menu_tile.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Curriculum")),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [Center(child: CurriculumMenuTile())],
        ),
      ),

      // const Center(child: CurriculumMenuTile()),
    );
  }
}
