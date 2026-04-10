import 'package:pdf/widgets.dart' as pw;
import 'package:codeit_app/model/receipt_model.dart';

class PdfGenerator {
  static Future<pw.Document> generateReceipt(ReceiptModel receipt) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Payment Receipt", style: pw.TextStyle(fontSize: 24)),

              pw.SizedBox(height: 20),

              pw.Text("Course: ${receipt.course}"),
              pw.Text("Transaction ID: ${receipt.transactionId}"),
              pw.Text("Date: ${receipt.date}"),
              pw.Text("Amount Paid: ${receipt.amount}"),

              pw.SizedBox(height: 20),

              pw.Text("Student: ${receipt.studentName}"),
              pw.Text("Email: ${receipt.email}"),
            ],
          );
        },
      ),
    );

    return pdf;
  }
}
