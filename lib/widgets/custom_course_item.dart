import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCourseItem extends StatelessWidget {
  final String title;
  final String mentor;
  final String videos;
  final String image;

  const CustomCourseItem({
    super.key,
    required this.title,
    required this.mentor,
    required this.videos,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: (){
          
        },
        child: Row(
          children: [
            //image
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        
            SizedBox(width: 10),
        
            //text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(mentor, style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("$videos videos", style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
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
