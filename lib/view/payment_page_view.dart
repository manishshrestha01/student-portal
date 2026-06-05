import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:codeit_app/widgets/custom_payment_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ReceiptController controller = Get.find<ReceiptController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchReceipts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;

          // Same responsive values as CourseView
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
          final double verticalGap = isSmall ? 24 : (isMedium ? 28 : 32);
          final double titleFontSize = isSmall ? 20 : (isMedium ? 22 : 25);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(verticalGap),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildBreadcrumb(isSmall),
                  ),
                  Gap(verticalGap),
                  Text(
                    "My Receipts",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Gap(verticalGap),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final receiptsList = controller.receipts;
                    print("Receipts Count: ${receiptsList.length}");

                    if (controller.hasError.value) {
                      return const Text("Failed to load payments");
                    }

                    if (controller.receipts.isEmpty) {
                      return const Text("No payments found");
                    }

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(64),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(controller.receipts.length, (
                          index,
                        ) {
                          final receipt = controller.receipts[index];
                          final isLast =
                              index == controller.receipts.length - 1;

                          return Column(
                            children: [
                              CustomPaymentReceipt(
                                title: receipt.courseName ?? "Course",
                                amount: receipt.amount?.toString() ?? "0",
                                date: receipt.enrolledDate ?? "",
                                icon: SvgPicture.asset(
                                  'assets/support/payments_border.svg',
                                  width: 40,
                                  height: 40,
                                ),
                                receiptId: receipt.receiptId ?? 0,
                              ),
                              if (!isLast)
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 14,
                                  endIndent: 14,
                                  color: AppColors.divider,
                                ),
                            ],
                          );
                        }),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBreadcrumb(bool isSmall) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              const Gap(7),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: isSmall ? 13 : 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(7),
        Icon(
          Icons.chevron_right,
          color: AppColors.iconMuted,
          size: isSmall ? 18 : 20,
        ),
        const Gap(7),
        Text(
          'Payment Receipts',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: isSmall ? 13 : 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
