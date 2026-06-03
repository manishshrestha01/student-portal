import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class Fonepay extends StatefulWidget {
  const Fonepay({super.key});

  @override
  State<Fonepay> createState() => _FonepayState();
}

class _FonepayState extends State<Fonepay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8C97A), width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Text(
            'We accept',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Gap(8),
          // FonePay logo badge
          Image.network(
            'https://codeit.com.np/images/fonepay.png',
            width: 120,
            scale: 1.5,
            fit: BoxFit.contain,
          ),
          const Gap(6),
          Text(
            'नेपाल राष्ट्र बैंकबाट अनुमति प्राप्त',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Gap(16),
          // QR Code box
          DottedBorder(
            options: const RoundedRectDottedBorderOptions(
              radius: Radius.circular(10),
              color: Color(0xFFffb86a),
              strokeWidth: 3,
              dashPattern: [6, 4],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  'https://codeit.com.np/images/esewa.jpg',
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Gap(14),
          Text(
            'Scan to Pay',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '*',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: AppColors.orangeAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gap(30),
              Expanded(
                child: Text(
                  'Please take a screenshot after the payment.',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
