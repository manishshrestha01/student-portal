import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomParentContainer extends StatelessWidget {
  final String title;
  final String seeall;
  final VoidCallback? onTapSeeAll;
  final List<Widget> children;

  const CustomParentContainer({
    super.key,
    required this.title,
    required this.seeall,
    this.onTapSeeAll,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    // for responsivedesign
    final screenWidth = MediaQuery.of(context).size.width;

    const baseWidth = 375.0;
    final scale = (screenWidth / baseWidth).clamp(0.8, 1.0);

    final titleFontSize = 25.0 * scale;
    final seeAllFontSize = 17.0 * scale;

    final horizontalPadding = (20.0 * scale).clamp(12.0, 32.0);
    final verticalPadding = (20.0 * scale).clamp(12.0, 32.0);

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        // border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 2,
            // offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ),
                Gap(20),
                InkWell(
                  onTap: onTapSeeAll,
                  child: Text(
                    seeall,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w400,
                        fontSize: seeAllFontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ...children,
        ],
      ),
    );
  }
}
