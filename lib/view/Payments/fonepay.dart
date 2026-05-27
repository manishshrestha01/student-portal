import 'package:flutter/material.dart';

class Fonepay extends StatefulWidget {
  const Fonepay({super.key});

  @override
  State<Fonepay> createState() => _FonepayState();
}

class _FonepayState extends State<Fonepay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: Colors.blue,
      child: const Center(
        child: Text(
          "We accept Fonepay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}