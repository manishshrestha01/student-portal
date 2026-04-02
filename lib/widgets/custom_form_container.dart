import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFormContainer extends StatelessWidget {
  final Widget child;

  const CustomFormContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.boxColor,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            offset: const Offset(0, 4),
            blurRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}