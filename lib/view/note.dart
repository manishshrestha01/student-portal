import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes & Resources"),
      backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Text("data"),
    );
  }
}