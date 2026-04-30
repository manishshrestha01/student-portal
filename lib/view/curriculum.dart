import 'package:flutter/material.dart';

class Curriculum extends StatefulWidget {
  const Curriculum({super.key});

  @override
  State<Curriculum> createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Curriculum"),
      backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Text("data"),
    );
  }
}