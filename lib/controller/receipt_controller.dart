
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/service/receipt_service.dart';
import 'package:get/get.dart';

class ReceiptController extends GetxController {
  final RxList<Datum> receipts = <Datum>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReceipts();
  }

  Future<void> fetchReceipts() async {
    try {
      isLoading(true);
      hasError(false);
      errorMessage('');

      final ReceiptModel? result = await ReceiptService.fetchReceipts();

      if (result == null) {
        hasError(true);
        errorMessage('Something went wrong. Please try again.');
        return;
      }

      if (result.success == true) {
        receipts.assignAll(result.data);
        print(result.data);
        print(result.runtimeType);
      } else {
        hasError(true);
        errorMessage('Failed to fetch receipts.');
      }
    } catch (e) {
      hasError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Datum? getReceiptById(int id) {
    try {
      return receipts.firstWhere((r) => r.receiptId == id);
    } catch (_) {
      return null;
    }
  }
}