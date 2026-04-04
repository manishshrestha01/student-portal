import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final String routeName;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textButtonColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
