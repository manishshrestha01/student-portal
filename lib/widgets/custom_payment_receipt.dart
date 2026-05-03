import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPaymentReceipt extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final Widget icon;
  final int receiptId;

  const CustomPaymentReceipt({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    required this.receiptId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Get.offAll(() => ReceiptView(receiptId: receiptId)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          children: [
            // Icon Box
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFDCEEF8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: icon),
            ),

            const Gap(14),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                   style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    "Amount: Rs.$amount  |  Date: $date",
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
