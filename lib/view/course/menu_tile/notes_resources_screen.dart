import 'package:flutter/material.dart';

class NotesResourcesScreen extends StatelessWidget {
  const NotesResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes & Resources")),

      body: const Center(child: Text("No notes & resources yet")),
    );
  }
}
