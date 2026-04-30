import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/view/payment_page_view.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_certificate_card.dart';
import 'package:codeit_app/widgets/custom_course_item.dart';
import 'package:codeit_app/widgets/custom_info_card.dart';
import 'package:codeit_app/widgets/custom_parent_container.dart';
import 'package:codeit_app/widgets/custom_payment_receipt.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final AuthController authController = Get.find<AuthController>();

  final ReceiptController controller = Get.put(ReceiptController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Obx(() {
        final user = authController.user.value;
        if (user == null) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF4F6CF7)),
          );
        }
        final firstName = (user.name ?? '').split(' ').first;
        return SingleChildScrollView(
          child: Center(
            child: Container(
              width: width > 600 ? 400 : width * 0.9,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back, $firstName!",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      Text(
                        "Here's your learning snapshot today.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),

                  // Info cards
                  Column(
                    children: [
                      InfoCard(
                        title: "Active Courses",
                        value: '2',
                        icon: Icons.menu_book,
                        onTap: () {
                          // Navigate to courses page
                        },
                      ),
                      Gap(6),
                      InfoCard(
                        title: "Certificates",
                        value: '2',
                        icon: Icons.workspace_premium,
                        onTap: () {
                          // Navigate to certificates page
                        },
                      ),
                      Gap(6),

                      Obx(() {
                        return InfoCard(
                          title: "Payments",
                          value: controller.receipts.length.toString(),
                          icon: Icons.payment,
                          onTap: () => Get.to(() => const PaymentPage()),
                        );
                      }),
                    ],
                  ),
                  Gap(20),

                  // Courses section
                  _buildCourseSection(context),
                  Gap(20),

                  // Payments section
                  _buildPaymentSection(context),

                  Gap(20),

                  // Certificates section
                  _buildCertificateSection(context),
             
              ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget _buildPaymentSection(BuildContext context) {
  final ReceiptController controller = Get.find<ReceiptController>();

  return Obx(() {
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
      onTapSeeAll: () => Get.to(() => const PaymentPage()),

      children: () {
        final items = controller.receipts.take(2).toList();
        final widgets = <Widget>[];
        for (int i = 0; i < items.length; i++) {
          final receipt = items[i];
          widgets.add(
            CustomPaymentReceipt(
              title: receipt.courseName ?? "Course",
              amount: receipt.amount?.toString() ?? "0",
              date: receipt.enrolledDate ?? "",
              icon: Icons.receipt,
              receiptId: receipt.receiptId ?? 0,
            ),
          );
          //add divider between items
          if (i < items.length - 1) {
            widgets.add(
              const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 16),
            );
          }
        }
        return widgets;
      }(),
    );
  });
}


Widget _buildCourseSection(BuildContext context) {
  final ReceiptController controller = Get.find<ReceiptController>();

  return Obx(() {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.hasError.value) {
      return const Text("Failed to load courses");
    }

    final courseItems = [
      CustomCourseItem(
        title: "Flutter Development",
        mentor: "Er. Sajal Shrestha",
        videos: "16",
        image: "assets/images/dashboard/course_image.png",
      ),
      CustomCourseItem(
        title: "Web Design",
        mentor: "Er. Sajal Shrestha",
        videos: "16",
        image: "assets/images/dashboard/course_image.png",
      ),
    ];


    return CustomParentContainer(
      title: "Your Courses",
      seeall: "See All",
      onTapSeeAll: () {
        // Navigate to courses page
      },
      children: courseItems,
    );
  });
}

Widget _buildCertificateSection(BuildContext context) {
  final ReceiptController controller = Get.find<ReceiptController>();

  return Obx(() {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.hasError.value) {
      return const Text("Failed to load certificates");
    }

    final certItems = [
      CustomCertificateCard(
        title: "Web Design",
        completed: "Feb 02, 2024",
        icon: Icons.star_border_sharp,
      ),
      CustomCertificateCard(
        title: "Flutter",
        completed: "Feb 02, 2025",
        icon: Icons.star_border_sharp,
      ),
    ];

    final widgets = <Widget>[];
    for (int i = 0; i < certItems.length; i++) {
      widgets.add(certItems[i]);
      if (i < certItems.length - 1) {
        widgets.add(
          const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 16),
        );
      }
    }

    return CustomParentContainer(
      title: "Certificates",
      seeall: "See All",
      onTapSeeAll: () {
        // Navigate to certificates page
      },
      children: widgets,
    );
  });
}
