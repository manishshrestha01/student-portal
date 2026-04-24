import 'package:codeit_app/controller/certificates_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/widgets/certificates_widget.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificatesView extends StatefulWidget {
  const CertificatesView({super.key});

  @override
  State<CertificatesView> createState() => _CertificatesViewState();
}

class _CertificatesViewState extends State<CertificatesView> {
  final CertificatesController certificateController =
      Get.find<CertificatesController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      certificateController.getCertificates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Obx(() {
        if (certificateController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final certificatesList = certificateController.certificate.value.data;
        print("Certificates Count: ${certificatesList.length}");
        if (certificatesList.isEmpty) {
          return const Center(child: Text("No certificates found."));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(32),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _buildBreadcrumb(),
                ),
                const Gap(32),
                Text(
                  'My Certificates',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Gap(32),
                ...certificatesList.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CertificatesWidget(
                      item: item,
                    ), 
                  );
                }),
                Gap(20),
              ],
            ),
          ),
        );
      }),
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
          'Certificates',
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
