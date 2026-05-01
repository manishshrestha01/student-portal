import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:codeit_app/widgets/custom_parent_container.dart';
import 'package:codeit_app/widgets/custom_payment_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceiptController controller = Get.find<ReceiptController>();
        return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(22),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildBreadcrumb(),
              ),
              const Gap(22),

              Obx(
                () {
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
                },
              )
              
           
            ],
          ),
        ),
      ),
    );
  }



Widget _buildBreadcrumb() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.7),
                  BlendMode.srcIn,
                ),
              ),
              const Gap(7),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
     const Gap(7),
        const Icon(
          Icons.chevron_right,
          color: Color.fromRGBO(0, 0, 0, 0.9),
          size: 20,
        ),
        const Gap(7),
        Text(
          'Payment Receipts',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      

      ],
    );
  }
}
