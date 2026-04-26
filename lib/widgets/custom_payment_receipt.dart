import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPaymentReceipt extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final IconData icon;

  const CustomPaymentReceipt({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
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
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReceiptView()),
          );
        },
        child: Row(
          children: [
            //icon
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 28, color: Colors.blue.shade800),
            ),
        
        
           Gap(10),
        
            //text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
        
                  Gap( 4),
        
                  Text("Rs.$amount", style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w500)),
        
                  Gap(4),
        
                  Text(date, style: TextStyle(
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