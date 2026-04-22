import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFormContainer extends StatelessWidget {
  final Widget child;

  const CustomFormContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth;

        // responsive breakpoints
        if (constraints.maxWidth > 1000) {
          maxWidth = 500; // desktop
        } else if (constraints.maxWidth > 600) {
          maxWidth = 450; // tablet
        } else {
          maxWidth = constraints.maxWidth * 0.92; // mobile
        }

        return Center(
          child: Container(
            width: maxWidth, 
            padding: const EdgeInsets.all(16), 
            margin: const EdgeInsets.symmetric(vertical: 20),

            decoration: BoxDecoration(
              color: AppColors.boxColor,
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(12),

              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),

            child: child,
          ),
        );
      },
    );
  }
}
