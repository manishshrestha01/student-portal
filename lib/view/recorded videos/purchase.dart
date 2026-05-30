import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Purchase extends StatefulWidget {
  const Purchase({super.key});

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.cannotedit,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Text("Purchase Recorded Videos"),
    );
  }
}