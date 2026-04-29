import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_parent_container.dart';
import 'package:codeit_app/widgets/custom_payment_receipt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceiptController controller = Get.find<ReceiptController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Payments",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAll(() =>  HomeView()),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.hasError.value) {
          return const Text("Failed to load payments");
        }

        if (controller.receipts.isEmpty) {
          return const Text("No payments found");
        }

        return CustomParentContainer(
          title: "Recent Payments",
          seeall: "See All",
          onTapSeeAll: () => Get.offAll(() => const ReceiptView()),
          
          children: controller.receipts.take(2).map((receipt) {
            return CustomPaymentReceipt(
              title: receipt.courseName ?? "Course",
              amount: receipt.amount?.toString() ?? "0",
              date: receipt.enrolledDate ?? "",
              icon: Icons.receipt,
            );
          }).toList(),
        );
      }),
    );
  }
}
