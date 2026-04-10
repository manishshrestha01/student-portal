import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:codeit_app/model/receipt_model.dart';
import '../utils/pdf_generator.dart';

class ReceiptService {
  static Future<void> printReceipt(ReceiptModel receipt) async {
    final pdf = await PdfGenerator.generateReceipt(receipt);

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  static Future<void> downloadReceipt(ReceiptModel receipt) async {
    final pdf = await PdfGenerator.generateReceipt(receipt);

    final directory = await getApplicationDocumentsDirectory();

    final file = File("${directory.path}/receipt.pdf");

    await file.writeAsBytes(await pdf.save());
  }

  static Future<void> shareReceipt(ReceiptModel receipt) async {
    final pdf = await PdfGenerator.generateReceipt(receipt);

    final directory = await getTemporaryDirectory();

    final file = File("${directory.path}/receipt.pdf");

    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles([XFile(file.path)]);
  }
}
