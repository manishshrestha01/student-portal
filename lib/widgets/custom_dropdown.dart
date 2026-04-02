import 'dart:math' as math;

import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategoryDropdown extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;
  final double? width;

  const CustomCategoryDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    this.width,
  });

  void _showMenu(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dialogWidth = math.min(screenWidth - 32, 315);

    showDialog(
      context: context,
      barrierColor: Colors.black45,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: dialogWidth,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildItem(context, 'General Support'),
                  const Gap(8),
                  _buildItem(context, 'Technical Support'),
                  const Gap(8),
                  _buildItem(context, 'Counselling Support'),
                  const Gap(8),
                  _buildItem(context, 'Internship Support'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, String title) {
    final bool isSelected = selectedValue == title;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(title);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            const Spacer(),
            const Gap(8),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFFFF6900) : Colors.black,
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
        width: width ?? 295,
        height: 39,
        decoration: BoxDecoration(
          color: AppColors.cannotedit,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFF9FAFB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedValue,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
                ),
              ),
              const Gap(6),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
