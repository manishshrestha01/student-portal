class ReceiptModel {
  final String course;
  final String amount;
  final String date;
  final String transactionId;
  final String studentName;
  final String email;

  ReceiptModel({
    required this.course,
    required this.amount,
    required this.date,
    required this.transactionId,
    required this.studentName,
    required this.email,
  });
}
