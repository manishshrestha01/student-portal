import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/payment_page_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:codeit_app/widgets/custom_print_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiptView extends StatelessWidget {
  final int receiptId;

  const ReceiptView({super.key, required this.receiptId});

  @override
  Widget build(BuildContext context) {
    final ReceiptController controller = Get.find<ReceiptController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
          final double verticalGap = isSmall ? 22 : (isMedium ? 24 : 28);

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
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.hasError.value) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              controller.errorMessage.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const Gap(12),
                            ElevatedButton(
                              onPressed: controller.fetchReceipts,
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      );
                    }

                    if (controller.receipts.isEmpty) {
                      return const Center(child: Text("No receipts found."));
                    }

                    final filtered = controller.receipts
                        .where((r) => r.receiptId == receiptId)
                        .toList();

                    if (filtered.isEmpty) {
                      return const Center(child: Text("Receipt not found."));
                    }

                    return Column(
                      children: filtered
                          .map((Datum receipt) => _buildReceiptCard(receipt))
                          .toList(),
                    );
                  }),
                  Gap(verticalGap),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReceiptCard(Datum receipt) {
    final AuthController authController = Get.find<AuthController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //Print button
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () async => await printReceipt(receipt),
            icon: Icon(Icons.print, color: AppColors.backgroundColor),
            label: Text(
              "Print Receipt",
              style: TextStyle(
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const Gap(12),

        //Receipt card
        Center(
          child: Container(
            width: 620,
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.symmetric(vertical: 14),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(64),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Payment Receipt",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const Gap(6),
                Text(
                  receipt.courseName ?? '-',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(20),

                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/code-it-logo.png',
                      width: 270,
                      height: 64,
                    ),
                  ],
                ),
                const Gap(20),

                // Transaction details
                _infoBlock(
                  "Transaction ID",
                  receipt.receiptId?.toString() ?? '-',
                ),
                _infoBlock("Date", receipt.enrolledDate ?? '-'),
                const Gap(10),

                // Payment status
                const Text(
                  "Payment Status",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                const Gap(6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF138023).withAlpha(30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF138023),
                        size: 18,
                      ),
                      const Gap(6),
                      Text(
                        "Paid",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF138023),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 30),

                // Student details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student Details",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  final user = authController.user.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        _rowText("Name", user?.name ?? "-"),
                        _rowText("WhatsApp", user?.phone ?? "-"),
                        _rowText("Email", user?.email ?? "-"),
                      ],
                    ),
                  );
                }),
                Gap(20),

                // Course details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Course Details",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.primary,
                        blurRadius: 0,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enrolled Course",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        receipt.courseName ?? '-',
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Divider(thickness: 1, height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Amount Paid:",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Rs. ${receipt.amount ?? '0'}/-",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Divider(height: 30),

                // Footer
                const Text(
                  "Thank you for choosing CODE IT. This is a \n computer-generated receipt.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const Gap(9),
                Text(
                  'For any queries, contact ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Gap(9),
                Text(
                  "support@codeit.com.np | Reg No.\n 11757/6371/04 | PAN 602345817",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ],
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
              const Gap(8),
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
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Get.to(() => PaymentPage()),
          child: Text(
            'Payment Receipts',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: AppColors.textMuted,
                fontSize: isSmall ? 13 : 15,
                fontWeight: FontWeight.w500,
              ),
            ),
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
          'Receipts',
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

//helpers widgets

Widget _infoBlock(String title, String value) {
  return Column(
    children: [
      Text(
        title,
        style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      const Gap(3),
      Text(
        value,
        style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w700),
      ),
      const Gap(10),
    ],
  );
}

Widget _rowText(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ),
        const Text(": "),
        Gap(4),

        Expanded(
          child: Text(
            value,
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
