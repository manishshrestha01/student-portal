import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        
      },
      child: Container(
      padding: EdgeInsets.all(16),
         
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            //icon
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 28, color: Colors.blue.shade800),
            ),
      
            Gap(12),
      
            // text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
      
                  Gap(4),
      
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
