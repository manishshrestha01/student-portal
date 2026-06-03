import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/model/recorded%20videos/store_model.dart';
import 'package:codeit_app/service/recorded%20videos/store_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
	var store = StoreModel(success: true, message: '', data: null).obs;
	var loadingIds = <String, bool>{}.obs;
	var errorMessage = ''.obs;

	bool isLoadingForId(String id) {
		return loadingIds[id] ?? false;
	}

	Future<void> submitStoreWithPayment(
		dynamic id,
		String plan,
		String filePath,
		bool terms,
	) async {
		final idString = id.toString();
		try {
			loadingIds[idString] = true;
			loadingIds.refresh();
			errorMessage('');

			final token = StorageController().getToken();
			if (token == null) {
				Get.offAllNamed('/login');
				return;
			}

			final response = await StoreService.submitStore(id, plan, filePath, terms);

			print("DEBUG: Submitting receipt -> id: $idString, plan: $plan, filePath: $filePath, terms: $terms");
			print("DEBUG: Submitted form data, awaiting response...");


			print("DEBUG: Response status code: ${response.statusCode}");
			print("DEBUG: Response data: ${response.data}");
			if (response.statusCode == 200 || response.statusCode == 201) {
				final responseData = response.data;
				if (responseData is Map<String, dynamic>) {
					store.value = StoreModel.fromJson(responseData);

							if (store.value.success == true) {
								if (Get.isRegistered<ReceiptController>()) {
									Get.find<ReceiptController>().fetchReceipts();
								}
							}

					Get.snackbar(
						store.value.success == true ? 'Success' : 'Error',
						store.value.message ?? 'Something went wrong',
						backgroundColor: store.value.success == true ? Colors.green : Colors.red,
						colorText: Colors.white,
						snackPosition: SnackPosition.TOP,
					);
				} else {
					store.value = StoreModel(success: false, message: '', data: null);
					errorMessage('Unexpected response format from server.');
				}
			} else {
				store.value = StoreModel(success: false, message: 'Server error', data: null);
				Get.snackbar(
					'Error',
					'Server error: ${response.statusCode}',
					backgroundColor: Colors.red,
					colorText: Colors.white,
					snackPosition: SnackPosition.TOP,
				);
			}
		} catch (e) {
			store.value = StoreModel(success: false, message: '', data: null);
			errorMessage('Could not submit payment. Please try again.');
			Get.snackbar(
				'Error',
				'Failed to submit payment: $e',
				backgroundColor: Colors.red,
				colorText: Colors.white,
				snackPosition: SnackPosition.TOP,
			);
		} finally {
			loadingIds[idString] = false;
			loadingIds.refresh();
		}
	}
}
