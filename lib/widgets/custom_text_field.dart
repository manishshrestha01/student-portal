import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final String? requiredMessage;

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
    this.textColor,
    this.requiredMessage,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: AppColors.textDark,
      ),
    );
    final requiredStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 18,
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    );
    final hintStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        color: AppColors.textLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    );

    return Column(
      children: [
        //w1 labeltext
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: labelStyle,
              ),

              if (isRequired) ...[
                Gap(2),

                Text(
                  "*",
                  style: requiredStyle,
                ),
              ],
            ],
          ),
        ],
        Gap(10),

        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator ??
              (value) {
                if (!isRequired) {
                  return null;
                }
                if (value == null || value.isEmpty) {
                  return requiredMessage ?? '$labelText is required';
                }
                return null;
              },
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle,
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
