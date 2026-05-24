import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            //icon
            icon,
        
            Gap(20),
        
            //text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.textDark),
                    ),
                  ),
        
                  Gap(3),
        
                  Text(
                    "Completed: $completed",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                         color: const Color(0xFF4a5565),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
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