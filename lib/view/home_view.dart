import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/certificates_controller.dart';
import 'package:codeit_app/controller/courses_controller.dart';
import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/view/certificates_view.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/payment_page_view.dart';
import 'package:codeit_app/widgets/courses_widget.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_certificate_card.dart';
import 'package:codeit_app/widgets/custom_course_item.dart';
import 'package:codeit_app/widgets/custom_info_card.dart';
import 'package:codeit_app/widgets/custom_parent_container.dart';
import 'package:codeit_app/widgets/custom_payment_receipt.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  

final AuthController authController = Get.find<AuthController>();
final ReceiptController receiptController = Get.put(ReceiptController());
final CoursesController coursesController = Get.put(CoursesController());
final CertificatesController certificatesController = Get.put(CertificatesController());

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
          return const SizedBox.shrink();
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
                    
                    // Active courses card
                      Obx((){
                        return InfoCard(
                          title: "Active Courses",
                          value: coursesController.courses.value.data.length
                              .toString(),
                          icon: SvgPicture.asset(
                            'assets/support/course_border.svg',
                            width: 55,
                            height: 55,
                          ),
                          onTap: () => Get.to(() => CourseView()),
                        );
                      }
                        
                      ),

                      Gap(20),

                     // Certificates card
                    Obx((){
                       return InfoCard(
                        title: "Certificates",
                        value: certificatesController.certificate.value.data.length.toString(),
                        icon: SvgPicture.asset(
                          'assets/support/certificate_border.svg',
                          width: 55,
                          height: 55,
                        ),
                        onTap: () => Get.to(() => CertificatesView()),
                      );
                    }),
                      Gap(20),

                      // Payments card
                      Obx(() {
                        return InfoCard(
                          title: "Payments",
                          value: receiptController.receipts.length.toString(),
                          icon: SvgPicture.asset(
                            'assets/support/payments_border.svg',
                            width: 55,
                            height: 55,
                          ),
                         onTap: () => Get.to(() => PaymentPage()),
                        );
                        
                      }),
                    ],
                  ),
                  Gap(20),

                  // Courses section
                  buildCourseSection(context),
                  Gap(20),

                  // Payments section
                  buildPaymentSection(context),

                  Gap(20),

                  // Certificates section
                  buildCertificateSection(context),
             
              ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget buildPaymentSection(BuildContext context) {
  final ReceiptController receiptController = Get.find<ReceiptController>();

  return Obx(() {
    if (receiptController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    if (receiptController.hasError.value) {
      return const Text("Failed to load payments");
    }

    if (receiptController.receipts.isEmpty) {
      return const Text("No payments found");
    }

    return CustomParentContainer(
      title: "Recent Payments",
      seeall: "See All",
      onTapSeeAll: () => Get.to(() => PaymentPage()),
      children: () {
        final items = receiptController.receipts.take(2).toList();
        final widgets = <Widget>[];
        for (int i = 0; i < items.length; i++) {
          final receipt = items[i];
          widgets.add(
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



Widget buildCourseSection(BuildContext context) {
  final CoursesController coursesController = Get.find<CoursesController>();

  return Obx(() {
    if (coursesController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    if (coursesController.errorMessage.value.isNotEmpty) {
      return const Text("Failed to load courses");
    }

    final data = coursesController.courses.value.data ?? [];

    if (data.isEmpty) {
      return const Text("No courses found");
    }

    return CustomParentContainer(
      title: "Your Courses",
      seeall: "See All",
      onTapSeeAll: () => Get.to(() => CourseView()),
      children: data
          .map(
            (course) => CustomCourseItem(
              title: course.courseName ?? "Course",
              mentor: course.mentorName ?? "",
              videos: course.lessons?.toString() ?? "0",
              image: course.courseImage ?? "assets/images/course_placeholder.png",
              onTap: () => Get.to(() => CoursesWidget(item: course)),
            ),
          )
          .toList(),
    );
  });
}


Widget buildCertificateSection(BuildContext context) {
  final CertificatesController certificatesController =
      Get.find<CertificatesController>();

  return Obx(() {
    if (certificatesController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    if (certificatesController.errorMessage.value.isNotEmpty) {
      return const Text("Failed to load certificates");
    }

    final data = certificatesController.certificate.value.data ?? [];

    if (data.isEmpty) {
      return const Text("No certificates found");
    }

    final widgets = <Widget>[];
    for (int i = 0; i < data.length; i++) {
      widgets.add(
        CustomCertificateCard(
          title: data[i].courseName ?? "Certificate",
          completed: data[i].courseCompletionDate ?? "",
          icon: SvgPicture.asset(
            'assets/support/certificate_border.svg',
            width: 40,
            height: 40,
          ),
         onTap:()=> Get.to(() => CertificatesView()),
        ),
      );
      if (i < data.length - 1) {
        widgets.add(
          const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 16),
        );
      }
    }

    return CustomParentContainer(
      title: "Certificates",
      seeall: "See All",
      onTapSeeAll: () => Get.to(() => CertificatesView()),
      children: widgets,
    );
  });
}
