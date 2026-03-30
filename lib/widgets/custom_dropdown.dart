import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategoryDropdown extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;

  const CustomCategoryDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  void _showMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black45,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 315,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildItem(context, "General Support"),
                  Gap(8),
                  _buildItem(context, "Technical Support"),
                  Gap(8),
                  _buildItem(context, "Counselling Support"),
                  Gap(8),
                  _buildItem(context, "Internship Support"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, String title) {
    bool isSelected = selectedValue == title;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(title); // Pass the data back to the parent
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cannotedit,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: isSelected ? 1 : 0,
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
            ),
            Spacer(),
            Gap(8),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Color(0xFFFF6900) : Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMenu(context),
      child: Container(
        width: 295,
        height: 39,
        decoration: BoxDecoration(
          color: AppColors.cannotedit,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFF9FAFB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: Offset(4, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Text(
                selectedValue,
                style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
              ),
              Spacer(),
              Gap(6),
              Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
