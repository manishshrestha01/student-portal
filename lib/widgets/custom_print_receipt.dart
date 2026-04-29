import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';

PdfColor toPdf(Color color) => PdfColor.fromInt(color.value);

Future<void> printReceipt(Datum receipt) async {
  final pdf = pw.Document();

  final darkColor = toPdf(AppColors.textDark);
  final greyColor = toPdf(AppColors.textLight);
  final bgGrey = toPdf(AppColors.boxColor);
  final greenColor = const PdfColor.fromInt(0xFF2E7D32);

  final titleStyle = pw.TextStyle(
    fontSize: 22,
    fontWeight: pw.FontWeight.bold,
    color: darkColor,
  );

  final labelStyle = pw.TextStyle(fontSize: 11, color: greyColor);

  final valueStyle = pw.TextStyle(
    fontSize: 12,
    fontWeight: pw.FontWeight.bold,
    color: darkColor,
  );

  pw.Widget infoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: labelStyle),
          pw.Text(value, style: valueStyle),
        ],
      ),
    );
  }

  pw.Widget divider() {
    return pw.Divider(color: greyColor, thickness: 0.8);
  }

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(40),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Center(child: pw.Text("Payment Receipt", style: titleStyle)),

            pw.SizedBox(height: 5),

            pw.Center(
              child: pw.Text(
                receipt.courseName ?? '-',
                style: pw.TextStyle(fontSize: 12, color: greyColor),
              ),
            ),

            pw.SizedBox(height: 20),
            divider(),

            infoRow("Transaction ID", receipt.receiptId?.toString() ?? '-'),
            infoRow("Date", receipt.enrolledDate ?? '-'),
            infoRow("Amount", "Rs. ${receipt.amount ?? '0'}/-"),

            pw.SizedBox(height: 10),

            pw.Row(
              children: [
                pw.Text("Status: ", style: labelStyle),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: pw.BoxDecoration(
                    color: const PdfColor.fromInt(0xFFE8F5E9),
                    borderRadius: pw.BorderRadius.circular(12),
                  ),
                  child: pw.Text(
                    "Paid",
                    style: pw.TextStyle(
                      fontSize: 11,
                      color: greenColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 20),
            divider(),

            pw.Text(
              "Course Details",
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: darkColor,
              ),
            ),

            pw.SizedBox(height: 8),

            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              decoration: pw.BoxDecoration(
                color: bgGrey,
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Text(
                receipt.courseName ?? '-',
                style: pw.TextStyle(
                  fontSize: 13,
                  fontWeight: pw.FontWeight.bold,
                  color: darkColor,
                ),
              ),
            ),

            pw.Spacer(),

            divider(),

            pw.Center(
              child: pw.Text(
                "Thank you for choosing CODE IT",
                style: pw.TextStyle(fontSize: 10, color: greyColor),
              ),
            ),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(onLayout: (format) async => pdf.save());
}
