import 'package:codeit_app/core/constants/colors.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanFeature {
  final String text;
  final bool included;
  PlanFeature(this.text, this.included);
}

class PlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final List<PlanFeature> features;
  final VoidCallback? onSelect;
  final bool selected;

  const PlanCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
    this.onSelect,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmall = screenWidth < 430;
    final Color headerBackground = const Color(0xFFF9FAFB);
    final Color bodyBackground = selected
        ? const Color(0xFFF9F1EE)
        : const Color(0xFFFFFFFF);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 2)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: headerBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isSmall ? 14 : 18,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w700,
                      fontSize: isSmall ? 20 : 22,
                    ),
                  ),
                ),
                const Gap(8),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.textTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: isSmall ? 13 : 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider line across full width
          Container(
            height: 1,
            color: const Color(0xFFE6E6E6),
            width: double.infinity,
          ),

          // Body section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: bodyBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isSmall ? 18 : 22,
              horizontal: 18,
            ),
            child: Column(
              //button alignment
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    price,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: isSmall ? 24 : 28,
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                ...features.map(
                  (f) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: f.included
                                ? AppColors.primary
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: f.included
                                  ? Colors.transparent
                                  : AppColors.iconMuted,
                            ),
                          ),
                          child: Icon(
                            f.included ? Icons.check : Icons.close,
                            color: f.included
                                ? Colors.white
                                : AppColors.iconMuted,
                            size: 16,
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: Text(
                            f.text,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: f.included
                                    ? AppColors.textDark
                                    : AppColors.iconMuted,
                                fontWeight: FontWeight.w500,
                                fontSize: isSmall ? 13 : 14,
                                decoration: f.included
                                    ? TextDecoration.none
                                    : TextDecoration.lineThrough,
                                decorationColor: AppColors.iconMuted,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(8),
                SizedBox(
                  height: 48,
                  child: selected
                      ? ElevatedButton(
                          onPressed: onSelect,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Selected',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: onSelect,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: AppColors.black,
                                width: 2,
                              ),
                            ),
                            ),
                          child: Text(
                            'Select Plan',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: isSmall ? 14 : 16,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
