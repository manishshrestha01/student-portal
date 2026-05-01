import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:codeit_app/widgets/custom_parent_container.dart';
import 'package:codeit_app/widgets/custom_payment_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceiptController controller = Get.put(ReceiptController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Obx(() {
        if (controller.hasError.value) {
          return const Center(
            child: Text("Failed to load payments"),
          );
        }

        if (controller.receipts.isEmpty) {
          return const Center(
            child: Text("No payments found"),
          );
        }

        return CustomParentContainer(
          title: "Recent Payments",
          seeall: "",
          onTapSeeAll: () => Get.offAll(() =>  ReceiptView(receiptId: 0)),
          
          children: controller.receipts.map((receipt) {
            return CustomPaymentReceipt(
              title: receipt.courseName ?? "Course",
              amount: receipt.amount?.toString() ?? "0",
              date: receipt.enrolledDate ?? "",
              icon: SvgPicture.asset(
                'assets/support/payments_border.svg',
                width: 40,
                height: 40,
              ),
              receiptId: receipt.receiptId ?? 0,
            );
          }).toList(),
        );
      }),
    );
  }
}