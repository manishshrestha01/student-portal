import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCertificateCard extends StatelessWidget {
  final String title;
  final String completed;
  final Widget icon;
  final VoidCallback? onTap;

  const CustomCertificateCard({
    super.key,     
    required this.title,
    required this.completed,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            //icon
            icon,
        
            Gap(10),
        
            //text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.textDark),
                  ),
        
                  Gap(4),
        
                  Text(
                    "Completed: $completed",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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