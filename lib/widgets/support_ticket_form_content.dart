import 'dart:math' as math;

import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportTicketFormContent extends StatefulWidget {
  final String initialCategory;
  final VoidCallback onHomeTap;

  const SupportTicketFormContent({
    super.key,
    required this.initialCategory,
    required this.onHomeTap,
  });

  @override
  State<SupportTicketFormContent> createState() =>
      _SupportTicketFormContentState();
}

class _SupportTicketFormContentState extends State<SupportTicketFormContent> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  @override
  void didUpdateWidget(covariant SupportTicketFormContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialCategory != widget.initialCategory) {
      selectedCategory = widget.initialCategory;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final bool isSmall = screenWidth < 390;
        final bool isMedium = screenWidth >= 390 && screenWidth < 768;
        final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
        final double contentWidth = math.min(
          screenWidth - (horizontalPadding * 2),
          620,
        );
        final double formWidth = math.min(contentWidth, 520);
        final double formHeight = isSmall ? 500 : 470;
        final double titleSize = isSmall ? 22 : 26;
        final double subtitleSize = isSmall ? 14 : 16;
        final double sectionTitleSize = isSmall ? 18 : 20;
        final double fieldLabelSize = isSmall ? 16 : 18;
        final double buttonLabelSize = isSmall ? 18 : 20;
        final double singleLineFieldHeight = isSmall ? 42 : 39;
        final double descriptionFieldHeight = isSmall ? 170 : 153;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(isSmall ? 20 : 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: widget.onHomeTap,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/support/home.svg',
                              width: 19.17,
                              height: 17.35,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF4B4B4B),
                                BlendMode.srcIn,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              'Home',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: const Color(0xFF4B4B4B),
                                  fontSize: isSmall ? 13 : 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(7),
                      Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF4B4B4B),
                        size: isSmall ? 18 : 20,
                      ),
                      const Gap(7),
                      Text(
                        'Support',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: const Color(0xFF4B4B4B),
                            fontSize: isSmall ? 13 : 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Gap(7),
                      Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF4B4B4B),
                        size: isSmall ? 18 : 20,
                      ),
                      const Gap(7),
                      Text(
                        'New Tickets',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: const Color(0xFF4B4B4B),
                            fontSize: isSmall ? 13 : 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(isSmall ? 18 : 20),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentWidth),
                    child: Text(
                      'Create Support Ticket',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: titleSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(4),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentWidth),
                    child: Text(
                      "Describe your issue - we'll respond as soon as possible.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: subtitleSize,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(isSmall ? 28 : 40),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/support/bi_ticket-fill.svg',
                      width: 26,
                      height: 16.25,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFFF6900),
                        BlendMode.srcIn,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'Ticket Information',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: sectionTitleSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Center(
                  child: Container(
                    width: formWidth,
                    height: formHeight,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFFFFFFF)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRequiredLabel('Category', fieldLabelSize),
                        const Gap(8),
                        CustomCategoryDropdown(
                          selectedValue: selectedCategory,
                          width: double.infinity,
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                        ),
                        const Gap(18),
                        _buildRequiredLabel('Subject', fieldLabelSize),
                        const Gap(8),
                        SizedBox(
                          height: singleLineFieldHeight,
                          child: _buildInputField(
                            hintText: 'e.g. Cannot access courses materials',
                            hintFontSize: isSmall ? 14 : 16,
                            inputFontSize: isSmall ? 16 : 18,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                        const Gap(18),
                        _buildRequiredLabel('Description', fieldLabelSize),
                        const Gap(8),
                        SizedBox(
                          height: descriptionFieldHeight,
                          child: _buildInputField(
                            hintText:
                                'Please explain in detail what happened, what you tried, any error messages, etc.',
                            hintFontSize: isSmall ? 14 : 16,
                            inputFontSize: 16,
                            isMultiline: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                              16,
                              12,
                              16,
                              12,
                            ),
                          ),
                        ),
                        const Gap(20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/support/submit.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              width: 22.5,
                              height: 22.5,
                            ),
                            label: Text(
                              'Submit Ticket',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: AppColors.boxColor,
                                  fontSize: buttonLabelSize,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6900),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(30),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRequiredLabel(String label, double fontSize) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Text(' *', style: TextStyle(color: Colors.red)),
      ],
    );
  }

  Widget _buildInputField({
    required String hintText,
    required double hintFontSize,
    required double inputFontSize,
    required EdgeInsets contentPadding,
    bool isMultiline = false,
  }) {
    return Container(
      width: double.infinity,
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
      child: TextField(
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: isMultiline ? AppColors.textDark : Colors.black,
            fontSize: inputFontSize,
            fontWeight: isMultiline ? FontWeight.normal : FontWeight.w400,
            letterSpacing: isMultiline ? -0.15 : 0,
          ),
        ),
        keyboardType: isMultiline
            ? TextInputType.multiline
            : TextInputType.text,
        maxLines: isMultiline ? null : 1,
        expands: isMultiline,
        textAlignVertical: isMultiline
            ? TextAlignVertical.top
            : TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.textLight,
              fontSize: hintFontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}
