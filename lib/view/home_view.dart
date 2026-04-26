import 'package:codeit_app/controller/auth_controller.dart';
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
                      ),
                      Gap(6),
                      InfoCard(
                        title: "Certificates",
                        value: '2',
                        icon: Icons.workspace_premium,
                      ),
                      Gap(6),
                      InfoCard(
                        title: "Payments",
                        value: '2',
                        icon: Icons.payment,
                      ),
                    ],
                  ),
                  Gap(20),
            
                  // Courses section
                  CustomParentContainer(
                    title: "Your Courses",
                    seeall: "See All",
                    onTapSeeAll: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReceiptView()),
                    ),

                    children: [
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
                    ],
                  ),
                  Gap(20),
            
                  // Payments section
                  CustomParentContainer(
                    title: "Recent Payments",
                    seeall: "See All",
                    onTapSeeAll: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiptView())),
                    
                    children: [
                      CustomPaymentReceipt(
                        title: "Web Design",
                        amount: "1199",
                        date: "Feb 02, 2024",
                        icon: Icons.receipt,
                      ),
                      CustomPaymentReceipt(
                        title: "Flutter",
                        amount: "2499",
                        date: "Feb 02, 2025",
                        icon: Icons.receipt,
                      ),
                    ],
                  ),
                  Gap(20),
            
                  // Certificates section
                  CustomParentContainer(
                    title: "Certificates",
                    seeall: "See All",
                    onTapSeeAll: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReceiptView()),
                    ),

                    children: [
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
