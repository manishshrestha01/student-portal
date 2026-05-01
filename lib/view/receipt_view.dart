import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/receipt_model.dart';
import 'package:codeit_app/view/home_view.dart';
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
    final ReceiptController controller = Get.put(ReceiptController());

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
           Obx(() {
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

                //Only show the receipt matching the receiptId
                final filtered = controller.receipts
                    .where((r) => r.receiptId == receiptId)
                    .toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text("Receipt not found."));
                }

                return Column(
                  children: filtered.map((Datum receipt) {
                    return _buildReceiptCard(receipt);
                  }).toList(),
                );
              }),   const Gap(36),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptCard(Datum receipt) {
    final AuthController authController = Get.find<AuthController>();

    return Column(
      children: [
        // Print button
        Padding(
          padding: const EdgeInsets.only(bottom: 12, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150,
                child: TextButton.icon(
                  onPressed: () async {
                    await printReceipt(receipt);
                  },
                  icon: Icon(Icons.print, color: AppColors.backgroundColor),
                  label: Text(
                    "Print Receipt",
                    style: TextStyle(color: AppColors.backgroundColor),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 12,
                    ),
                    backgroundColor: const Color(0xFFFF6900),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Center(
          child: Container(
            width: 620,
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFFFFFFF)),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(64),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
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
                      width: 120,
                      height: 40,
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
                    color: Colors.green.withAlpha(38),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18,
                      ),
                      const Gap(6),
                      Text(
                        "Paid",
                        style: GoogleFonts.inter(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 30),

                //Student details
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Student Details",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),

                Obx(() {
                  final user = authController.user.value;

                  return Column(
                    children: [
                      _rowText("Name", user?.name ?? "-"),
                      _rowText("WhatsApp", user?.phone ?? "-"),
                      _rowText("Email", user?.email ?? "-"),
                    ],
                  );
                }),

                //Course details
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Course Details",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),

                const Gap(10),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textButtonColor.withAlpha(200),
                        blurRadius: 4,
                        offset: const Offset(0, 6),
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        receipt.courseName ?? '-',
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Divider(),
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

                const Gap(20),

                //footer
                const Text(
                  "Thank you for choosing CODE IT. This is a \n computer-generated receipt.\n\n For any queries, contact \n\n support@codeit.com.np | Reg No.\n 11757/6271/04 | PAN 602345817",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),

                const Gap(20),
              ],
            ),
          ),
        ),
      ],
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
              const Gap(8),
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
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ),

    

         Text(": "),

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