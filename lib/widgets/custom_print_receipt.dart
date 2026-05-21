import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> printReceipt(Datum receipt) async {
  final AuthController authController = Get.find<AuthController>();
  final user = authController.user.value;

  final fontRegular = await PdfGoogleFonts.interRegular();
  final fontBold = await PdfGoogleFonts.interBold();
  final fontMedium = await PdfGoogleFonts.interMedium();
  final fontLight = await PdfGoogleFonts.interLight();

  final pdf = pw.Document();

  final logoImage = await imageFromAssetBundle(
    'assets/images/code-it-logo.png',
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              'Payment Receipt',
              style: pw.TextStyle(font: fontBold, fontSize: 22),
            ),
            pw.SizedBox(height: 6),
            pw.Text(
              receipt.courseName ?? '-',
              style: pw.TextStyle(font: fontRegular, fontSize: 18),
              textAlign: pw.TextAlign.center,
            ),
            pw.SizedBox(height: 16),

            pw.Image(logoImage, width: 270, height: 64),
            pw.SizedBox(height: 16),

            _pdfInfoBlock(
              'Transaction ID',
              receipt.receiptId?.toString() ?? '-',
              fontRegular,
              fontBold,
            ),
            _pdfInfoBlock(
              'Date',
              receipt.enrolledDate ?? '-',
              fontRegular,
              fontBold,
            ),
            pw.SizedBox(height: 10),

            pw.Text(
              'Payment Status',
              style: pw.TextStyle(font: fontRegular, fontSize: 18),
            ),
            pw.SizedBox(height: 6),

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 6,
              ),
              decoration: pw.BoxDecoration(
                color: PdfColors.green200,
                borderRadius: pw.BorderRadius.circular(15),
              ),
              child: pw.Row(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Container(
                    width: 22,
                    height: 22,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.green600,
                      shape: pw.BoxShape.circle,
                    ),
                    alignment: pw.Alignment.center,
                    child: pw.Text(
                      '✓',
                      style: pw.TextStyle(
                        font: fontBold,
                        color: PdfColors.white,
                        fontSize: 15,
                      ),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.SizedBox(width: 8),
                  pw.Text(
                    'Paid',
                    style: pw.TextStyle(
                      font: fontMedium,
                      color: PdfColors.green700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            pw.Divider(height: 30),

            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Student Details',
                style: pw.TextStyle(font: fontBold, fontSize: 24),
              ),
            ),
            pw.SizedBox(height: 8),
            _pdfRowText('Name', user?.name ?? '-', fontLight, fontMedium),
            _pdfRowText('WhatsApp', user?.phone ?? '-', fontLight, fontMedium),
            _pdfRowText('Email', user?.email ?? '-', fontLight, fontMedium),

            pw.SizedBox(height: 12),

            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Course Details',
                style: pw.TextStyle(font: fontBold, fontSize: 24),
              ),
            ),
            pw.SizedBox(height: 8),

            pw.Container(
              padding: const pw.EdgeInsets.all(14),

              decoration: pw.BoxDecoration(
                color: PdfColors.white,
                borderRadius: pw.BorderRadius.circular(16),
                border: pw.Border.all(color: PdfColors.black),           
              ),

              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Enrolled Course',
                    style: pw.TextStyle(font: fontRegular, fontSize: 18),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    receipt.courseName ?? '-',
                    style: pw.TextStyle(font: fontBold, fontSize: 24),
                  ),
                  pw.Divider(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Amount Paid:',
                        style: pw.TextStyle(font: fontBold, fontSize: 18),
                      ),
                      pw.Text(
                        'Rs. ${receipt.amount ?? '0'}/-',
                        style: pw.TextStyle(
                          font: fontBold,
                          color: const PdfColor.fromInt(0xFFFF6900),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
               pw.SizedBox(height:10),
            pw.Divider(height: 30),

            pw.SizedBox(height:10),

            pw.Text(
              'Thank you for choosing CODE IT. This is a computer-generated receipt.\n'
              'For any queries, contact\n'
              'support@codeit.com.np | Reg No. 11757/6271/04 | PAN 602345817',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(font: fontRegular, fontSize: 14),
            ),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (_) async => pdf.save(),
    name: 'Receipt_${receipt.receiptId ?? 'unknown'}.pdf',
  );
}

pw.Widget _pdfInfoBlock(
  String title,
  String value,
  pw.Font fontRegular,
  pw.Font fontBold,
) {
  return pw.Column(
    children: [
      pw.Text(title, style: pw.TextStyle(font: fontRegular, fontSize: 18)),
      pw.SizedBox(height: 2),
      pw.Text(value, style: pw.TextStyle(font: fontBold, fontSize: 20)),
      pw.SizedBox(height: 8),
    ],
  );
}

pw.Widget _pdfRowText(
  String label,
  String value,
  pw.Font fontLight,
  pw.Font fontMedium,
) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 3),
    child: pw.Row(
      children: [
        pw.Expanded(
          child: pw.Text(
            label,
            style: pw.TextStyle(font: fontLight, fontSize: 18),
          ),
        ),
        pw.Text(': ', style: pw.TextStyle(font: fontLight, fontSize: 18)),
        pw.Expanded(
          child: pw.Text(
            value,
            style: pw.TextStyle(font: fontMedium, fontSize: 18),
          ),
        ),
      ],
    ),
  );
}
