import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/receipt_controller.dart';
import 'package:codeit_app/controller/courses_controller.dart';
import 'package:codeit_app/controller/certificates_controller.dart';
import 'package:codeit_app/view/certificates_view.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/link_view.dart';
import 'package:codeit_app/view/payment_page_view.dart';
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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AuthController authController = Get.find<AuthController>();
  final ReceiptController receiptController = Get.put(ReceiptController());
  final CoursesController coursesController = Get.put(CoursesController());
  final CertificatesController certificatesController = Get.put(
    CertificatesController(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      coursesController.getCourses();
      certificatesController.getCertificates();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:  const Color(0xFFf9fafb),
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
                  LinkView(),

                  Gap(20),

                  // Info cards
                  Column(
                    children: [
                      Obx(() {
                        return InfoCard(
                          title: "Active Courses",
                          value: coursesController.courses.value.data.length
                              .toString(),
                          icon: SvgPicture.asset(
                            'assets/support/course_border.svg',
                            width: 55,
                            height: 55,
                          ),
                          onTap: () => Get.offAll(() => const CourseView()),
                        );
                      }),
                      Gap(20),
                      Obx(() {
                        return InfoCard(
                          title: "Certificates",
                          value: certificatesController
                              .certificate
                              .value
                              .data
                              .length
                              .toString(),
                          icon: SvgPicture.asset(
                            'assets/support/certificate_border.svg',
                            width: 55,
                            height: 55,
                          ),
                          onTap: () =>
                              Get.offAll(() => const CertificatesView()),
                        );
                      }),
                      Gap(20),

                      Obx(() {
                        return InfoCard(
                          title: "Payments",
                          value: receiptController.receipts.length.toString(),
                          icon: SvgPicture.asset(
                            'assets/support/payments_border.svg',
                            width: 55,
                            height: 55,
                          ),
                          onTap: () => Get.to(() => const PaymentPage()),
                        );
                      }),
                    ],
                  ),
                  Gap(40),

                  // Courses section
                  _buildCourseSection(context),
                  Gap(40),

                  // Payments section
                  _buildPaymentSection(context),

                  Gap(40),

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
    if (controller.hasError.value) {
      return const Text("Failed to load payments");
    }

    if (controller.receipts.isEmpty) {
      return const Text("No payments found");
    }

    return CustomParentContainer(
      title: "Payments",
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
              icon: SvgPicture.asset(
                'assets/support/payments_border.svg',
                width: 40,
                height: 40,
              ),
              receiptId: receipt.receiptId ?? 0,
            ),
          );
       Gap(12);
          //add divider between items
          if (i < items.length - 1) {
            widgets.add(
              const Divider(
                height: 1,
                thickness: 1,
                indent: 14,
                endIndent: 14,
                color: Color.fromARGB(255, 223, 219, 219),
              ),
            );
          }
        }
        return widgets;
      }(),
    );
  });
}

Widget _buildCourseSection(BuildContext context) {
  final CoursesController coursesController = Get.find<CoursesController>();

  return Obx(() {
    if (coursesController.errorMessage.value.isNotEmpty) {
      return const Text("Failed to load courses");
    }

    final courses = coursesController.courses.value.data;

    if (courses.isEmpty) {
      return const Text("No courses available");
    }

    final courseItems = courses.take(2).map((course) {
      return CustomCourseItem(
        title: course.courseName ?? "Course",
        mentor: course.mentorName ?? "Instructor",
        videos: course.lessons?.toString() ?? "0",
        image: course.courseImage ?? "",
        onTap: () => Get.to(() => CourseView()),
      );
    }).toList();

    return CustomParentContainer(
      title: "My Courses",
      seeall: "See All",
      onTapSeeAll: () => Get.to(() => const CourseView()),
      children: courseItems,
    );
  });
}

Widget _buildCertificateSection(BuildContext context) {
  final CertificatesController certificatesController =
      Get.find<CertificatesController>();

  return Obx(() {
    if (certificatesController.errorMessage.value.isNotEmpty) {
      return const Text("Failed to load certificates");
    }

    final certificates = certificatesController.certificate.value.data;

    if (certificates.isEmpty) {
      return const Text("No certificates available");
    }

    final certItems = certificates.take(2).map((cert) {
      return CustomCertificateCard(
        title: cert.courseName ?? "Certificate",
        completed: cert.courseCompletionDate ?? "N/A",
        icon: SvgPicture.asset(
          'assets/support/certificate_border.svg',
          width: 40,
          height: 40,
        ),
        onTap: () => Get.to(() => const CertificatesView()),
      );
    }).toList();
  
    final widgets = <Widget>[];
    for (int i = 0; i < certItems.length; i++) {
      widgets.add(
        certItems[i]);

      if (i < certItems.length - 1) {
        widgets.add(
          const Divider(
            height: 1,
            thickness: 1,
            indent: 14,
            endIndent: 14,
            color: Color.fromARGB(255, 223, 219, 219),
          ),
        );
      }
    }

    return CustomParentContainer(
      title: "Certificates",
      seeall: "See All",
      onTapSeeAll: () => Get.to(() => const CertificatesView()),
      children: widgets,
    );
  });
}
