import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Widget page;


  const CustomTextButton({
    super.key,
    required this.text,
    required this.page,    
    });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }, child: Text(
      text,
      style: TextStyle(
        color: AppColors.textButtonColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ));
  }
}