import 'package:flutter/material.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/service/receipt_service.dart';

class ReceiptDetailScreen extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptDetailScreen({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Receipt")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.print),
                label: const Text("Print Receipt"),

                onPressed: () {
                  ReceiptService.printReceipt(receipt);
                },
              ),
            ),

            const SizedBox(height: 16),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const Text(
                      "Payment Receipt",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Full Stack Web Development in Laravel",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    Image.asset("assets/codeit_logo.png", height: 60),

                    const SizedBox(height: 20),

                    Text(
                      "Transaction ID\n${receipt.transactionId}",
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 10),

                    Text("Date\n${receipt.date}", textAlign: TextAlign.center),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Paid",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),

                    const Divider(height: 30),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Student Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Full Name"),
                        Text(receipt.studentName),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("Email"), Text(receipt.email)],
                    ),

                    const Divider(height: 30),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Course Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Enrolled Course"),
                              Text(receipt.course),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Amount Paid"),
                              Text(
                                receipt.amount,
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Thank you for choosing CODE IT.\nThis is a computer-generated receipt.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text("Download"),
                  onPressed: () {
                    ReceiptService.downloadReceipt(receipt);
                  },
                ),

                ElevatedButton.icon(
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                  onPressed: () {
                    ReceiptService.shareReceipt(receipt);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
