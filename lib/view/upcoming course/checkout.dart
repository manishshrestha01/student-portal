import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFf9fafb),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Text("Checkout"),
    );
  }
}