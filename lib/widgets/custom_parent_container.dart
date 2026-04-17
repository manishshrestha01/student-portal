import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomParentContainer extends StatelessWidget {
  final String title;
  final String seeall;

  final List<Widget> children;

  const CustomParentContainer({super.key,
  required this.title,
  required this.seeall,
   required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(children: [
         Container(
          padding: EdgeInsets.all(14),
           child: Row(
            
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                InkWell(
                  onTap: (){
                    
                  },
                  child: Text(seeall, style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w500))),
              ],
            ),
         ),

        ...children,
      ]),
    );
  }
}