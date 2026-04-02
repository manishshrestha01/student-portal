import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
  required this.text,
  required this.onPressed,
  this.isLoading = false,
  this.backgroundColor,
  this.textColor,
  this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        onPressed: isLoading ? null: onPressed, 
        style: FilledButton.styleFrom(backgroundColor: backgroundColor ?? AppColors.primary,side: BorderSide(color: borderColor ?? Colors.transparent, width: 2)  ,  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
        
        child: isLoading ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        
      )
      : Text(text, style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),)
      ),
    );
  }
}