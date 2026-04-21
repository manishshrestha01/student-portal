import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VideoPage extends StatelessWidget {
  final String title;

  const VideoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          // Video Placeholder
          Container(
            height: 220,
            width: double.infinity,
            color: Colors.black,
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),

          const Gap(10),

          // CONTENT / NOTES
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.white,
              child: const SingleChildScrollView(
                child: Text(
                  "Here will be your notes / PDF / lesson content.\n\n",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
