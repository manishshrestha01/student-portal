import 'package:flutter/material.dart';

class DocsView extends StatefulWidget {
  const DocsView({super.key});

  @override
  State<DocsView> createState() => _DocsViewState();
}

class _DocsViewState extends State<DocsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CODE IT"),
      centerTitle: false,
      backgroundColor: const Color(0xFFF85604),
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Documents")
            ],
          )
        ],
      ),
    );
  }
}