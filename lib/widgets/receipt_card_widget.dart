import 'package:flutter/material.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/view/receipt/receipt_detail_screen.dart';

class ReceiptCard extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptCard({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(14),

        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.receipt),
        ),

        title: Text(
          receipt.course,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text("Amount: ${receipt.amount} | Date: ${receipt.date}"),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReceiptDetailScreen(receipt: receipt),
            ),
          );
        },
      ),
    );
  }
}
