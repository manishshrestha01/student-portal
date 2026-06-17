import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/terms_controller.dart';
import 'package:codeit_app/controller/upcoming%20course/upcoming_controller.dart';
import 'package:codeit_app/controller/upcoming%20course/admission_controller.dart';
import 'package:codeit_app/view/Payments/bankaccount.dart';
import 'package:codeit_app/view/Payments/fonepay.dart';
import 'package:codeit_app/view/upcoming%20course/upcoming_classes_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'dart:io';

import '../home_view.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final UpcomingController upcomingController = Get.find<UpcomingController>();
  final AuthController authController = Get.find<AuthController>();
  final AdmissionController admissionController =
      Get.find<AdmissionController>();
  bool _agreeToTerms = false;
  final TermsController termsController = Get.find<TermsController>();
  String? _selectedFilePath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.fetchUser();
      termsController.getTerms();
      upcomingController.getUpcomingClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cannotedit,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 430;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);
          final double summaryFontSize = isSmall ? 16 : 18;
          final double summaryValueFontSize = isSmall ? 17 : 18;
          final double amountFontSize = isSmall ? 26 : 28;
          final double studentValueFontSize = isSmall ? 17 : 18;
          final double termsFontSize = isSmall ? 15 : 16;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(isSmall ? 24 : 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildBreadcrumb(isSmall),
                  ),
                  Gap(isSmall ? 24 : 32),
                  Center(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                        isSmall ? 12 : 18,
                        14,
                        isSmall ? 12 : 18,
                        20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.white),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: AppColors.shadow, blurRadius: 2),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_sharp,
                                  color: AppColors.primary,
                                  size: 28,
                                ),
                                const Gap(10),
                                Text(
                                  'Checkout Summary',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: AppColors.textDark,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Divider(color: AppColors.divider, thickness: 0.5),
                            const Gap(10),
                            Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Course:',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: AppColors.textDark,
                                        fontWeight: FontWeight.w400,
                                        fontSize: summaryFontSize,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      upcomingController
                                              .selectedCourse
                                              .value
                                              ?.courseName ??
                                          'N/A',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          color: AppColors.textDark,
                                          fontWeight: FontWeight.w600,
                                          fontSize: summaryValueFontSize,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(6),
                            Obx(
                              () => Row(
                                children: [
                                  Text(
                                    'Batch Starts:',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: AppColors.textDark,
                                        fontWeight: FontWeight.w400,
                                        fontSize: summaryFontSize,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    upcomingController
                                            .selectedCourse
                                            .value
                                            ?.startDate ??
                                        '--',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: summaryValueFontSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(6),
                            Obx(
                              () => Row(
                                children: [
                                  Text(
                                    'Duration:',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: summaryFontSize,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    upcomingController
                                            .selectedCourse
                                            .value
                                            ?.courseDuration ??
                                        '--',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: summaryValueFontSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(6),
                            Row(
                              children: [
                                Text(
                                  'Mode:',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: summaryFontSize,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Online (Google Meet)',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: summaryValueFontSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Divider(color: Colors.grey, thickness: 0.5),
                            const Gap(10),
                            Obx(
                              () => Row(
                                children: [
                                  Text(
                                    'Total Amount:',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: summaryFontSize,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rs. ${upcomingController.selectedCourse.value?.offerPrice?.isEmpty ?? true ? '--' : upcomingController.selectedCourse.value!.offerPrice}/-',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.w800,
                                            fontSize: amountFontSize,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rs. ${upcomingController.selectedCourse.value?.actualPrice?.isEmpty ?? true ? '--' : upcomingController.selectedCourse.value!.actualPrice}',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                color: Color(0xFF6a7282),
                                                fontWeight: FontWeight.w500,
                                                fontSize: isSmall ? 14 : 15,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: Color(
                                                  0xFF6a7282,
                                                ),
                                                decorationThickness: 1,
                                              ),
                                            ),
                                          ),
                                          const Gap(8),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: isSmall ? 6 : 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFdcfce6),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              'Save ${upcomingController.selectedCourse.value?.discount?.isEmpty ?? true ? '--' : upcomingController.selectedCourse.value!.discount}',
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF008236),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: isSmall ? 11 : 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(20),
                            Divider(
                              color: const Color(0xFFffd6a8),
                              thickness: 2,
                            ),
                            const Gap(20),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_sharp,
                                  color: Colors.deepOrange,
                                  size: 28,
                                ),
                                const Gap(10),
                                Text(
                                  'Student Details',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFf9fafb),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(isSmall ? 12 : 15),
                                child: Obx(
                                  () => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Full Name',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                color: const Color(0xFF6a7282),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(4),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              authController
                                                          .user
                                                          .value
                                                          ?.name
                                                          ?.isEmpty ??
                                                      true
                                                  ? '--'
                                                  : authController
                                                        .user
                                                        .value!
                                                        .name!,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      studentValueFontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(10),
                                      Row(
                                        children: [
                                          Text(
                                            'Email',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                color: const Color(0xFF6a7282),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(4),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              authController
                                                          .user
                                                          .value
                                                          ?.email
                                                          ?.isEmpty ??
                                                      true
                                                  ? '--'
                                                  : authController
                                                        .user
                                                        .value!
                                                        .email!,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      studentValueFontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(10),
                                      Row(
                                        children: [
                                          Text(
                                            'Whatsapp',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                color: const Color(0xFF6a7282),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(4),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              authController
                                                          .user
                                                          .value
                                                          ?.phone
                                                          ?.isEmpty ??
                                                      true
                                                  ? '--'
                                                  : authController
                                                        .user
                                                        .value!
                                                        .phone!,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      studentValueFontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Gap(10),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Divider(
                              color: const Color(0xFFffd6a8),
                              thickness: 2,
                            ),
                            const Gap(20),
                            //fonepay and bank transfer sections
                            const Fonepay(),
                            const Gap(20),
                            const Bankaccount(),
                            const Gap(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upload Payment Receipt',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: isSmall ? 17 : 18,
                                    ),
                                  ),
                                ),
                                Gap(6),
                                Text(
                                  '*',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: _pickFromGallery,
                              child: DottedBorder(
                                options: const RoundedRectDottedBorderOptions(
                                  radius: Radius.circular(20),
                                  color: Color(0xFF99a1af),
                                  strokeWidth: 3,
                                  dashPattern: [8, 4],
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF99a1af),
                                      width: 3,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: _selectedFilePath != null
                                      ? Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Image.file(
                                              File(_selectedFilePath!),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                            Positioned(
                                              top: 8,
                                              right: 8,
                                              child: GestureDetector(
                                                behavior:
                                                    HitTestBehavior.opaque,
                                                onTap: () {
                                                  setState(() {
                                                    _selectedFilePath = null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                    4,
                                                  ),
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/support/upload.svg',
                                              width: 48,
                                              height: 48,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                    Color(0xFF6a7282),
                                                    BlendMode.srcIn,
                                                  ),
                                            ),
                                            const Gap(5),
                                            Text(
                                              'Click to upload receipt',
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: const Color(
                                                    0xFF4a5565,
                                                  ),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: isSmall ? 16 : 18,
                                                ),
                                              ),
                                            ),
                                            const Gap(5),
                                            Text(
                                              '(PNG, JPG • Max 2MB)',
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: const Color(
                                                    0xFF4a5565,
                                                  ),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            Gap(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    setState(() {
                                      _agreeToTerms = !_agreeToTerms;
                                    });
                                  },
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Transform.scale(
                                      scale: 0.9,
                                      child: Checkbox(
                                        value: _agreeToTerms,
                                        onChanged: (value) {
                                          setState(() {
                                            _agreeToTerms = value ?? false;
                                          });
                                        },
                                        activeColor: Colors.deepOrange,
                                        checkColor: Colors.white,
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () =>
                                        _showTermsAndConditions(context),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: termsFontSize,
                                              height: 1.25,
                                            ),
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'I agree to the ',
                                            ),
                                            TextSpan(
                                              text: 'Terms and Conditions',
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: termsFontSize,
                                                  height: 1.25,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _agreeToTerms
                                    ? () {
                                        if (_selectedFilePath == null) {
                                          Get.snackbar(
                                            'Error',
                                            'Please upload payment receipt',
                                            snackPosition: SnackPosition.TOP,
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            borderRadius: 12,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            dismissDirection:
                                                DismissDirection.up,
                                          );
                                        } else {
                                          _confirmPayment();
                                        }
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFf85604),
                                  disabledBackgroundColor: Colors.grey.shade400,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Confirm Payment & Enroll',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "🔒 Secure payment • Fast verification • Lifetime access after confirmation",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(30),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "By completing this payment, you agree to our terms and conditions. Verification may take up to 24 hours. You'll receive WhatsApp group invite and portal access upon verification.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        color: Color.fromARGB(221, 78, 78, 78),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickFromGallery() async {
    try {
      final picker = image_picker.ImagePicker();
      final image = await picker.pickImage(
        source: image_picker.ImageSource.gallery,
      );

      if (image != null) {
        final int fileSizeInBytes = await image.length();
        final double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

        // Validate file size (max 2MB)
        if (fileSizeInMB > 2) {
          Get.snackbar(
            'Error',
            'File size must be less than 2MB',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            borderRadius: 12,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            dismissDirection: DismissDirection.up,
          );
          return;
        }

        setState(() {
          _selectedFilePath = image.path;
        });

        Get.snackbar(
          'Success',
          'File uploaded successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          borderRadius: 12,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          dismissDirection: DismissDirection.up,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error picking image.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        borderRadius: 12,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        dismissDirection: DismissDirection.up,
      );
    }
  }

  Future<void> _confirmPayment() async {
    try {
      if (_selectedFilePath == null) {
        Get.snackbar(
          'Error',
          'Please upload payment receipt',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          borderRadius: 12,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          dismissDirection: DismissDirection.up,
        );
        return;
      }

      // Get the upcoming ID from the selected course (NOT courseId)
      final selectedCourseData = upcomingController.selectedCourse.value;
      final upcomingId = selectedCourseData?.upcomingId;

      if (upcomingId == null) {
        Get.snackbar(
          'Error',
          'Course information not available. Please select a course.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          borderRadius: 12,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          dismissDirection: DismissDirection.up,
        );
        return;
      }

      // Submit admission with payment receipt using upcomingId
      await admissionController.submitAdmissionWithPayment(
        upcomingId,
        _selectedFilePath!,
        _agreeToTerms,
      );

      // Navigate to home after successful submission
      if (admissionController.submitadmission.value.success == true) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAll(() => HomeView());
        });
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error confirming payment.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        borderRadius: 12,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        dismissDirection: DismissDirection.up,
      );
    }
  }

  void _showTermsAndConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: 600,
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms and Conditions',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: Obx(() {
                  if (termsController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
                  }
                  final String content =
                      (termsController.terms.value.data ?? '').trim();
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: content.isEmpty
                        ? Text(
                            'No terms available.',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : HtmlWidget(
                            content,
                            textStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                height: 1.6,
                              ),
                            ),
                          ),
                  );
                }),
              ),
              // Footer Button
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'I Understand',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
                colorFilter: ColorFilter.mode(
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
          onTap: () => Get.offAll(() => UpcomingClassesView()),
          child: Text(
            'Upcoming Classes',
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
          'Checkout',
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
