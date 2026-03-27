import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final String hintText;
  final bool isRequired;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
   final Color? textColor;

  const CustomTextField({
    super.key,
    this.labelText,
    this.keyboardType,
    required this.hintText,
    this.isRequired = false,
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //w1 labeltext
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              if (isRequired) ...[
                SizedBox(width: 3),

                Text(
                  "*",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ],
        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,hintStyle: TextStyle(color: AppColors.textLight, fontWeight: .w400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
