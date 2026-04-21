import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/widgets/receipt_card_widget.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example receipts (later you can fetch from API)
    final List<ReceiptModel> receipts = [
      ReceiptModel(
        course: "Web Design",
        amount: "Rs.1199",
        date: "Feb 02, 2024",
        transactionId: "000000000000",
        studentName: "Full Name",
        email: "example@gmail.com",
      ),

      ReceiptModel(
        course: "Web Design",
        amount: "Rs.1199",
        date: "Feb 02, 2024",
        transactionId: "000000000001",
        studentName: "Full Name",
        email: "example@gmail.com",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: CustomAppBar(),
      drawer: CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView.builder(
          itemCount: receipts.length,

          itemBuilder: (context, index) {
            final receipt = receipts[index];

            return ReceiptCard(receipt: receipt);
          },
        ),
      ),
    );
  }
}
