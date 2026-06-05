import 'package:codeit_app/controller/verify_otp_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 390;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: CustomFormContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/images/code-it-logo.png',
                            height: isSmall ? 58 : 67,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                          Gap(isSmall ? 16 : 20),
                          Text(
                            'Check your mail',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: isSmall ? 22 : 26,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                                color: AppColors.textDark,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(isSmall ? 8 : 10),
                          Text(
                            "We've sent the code to your email",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: isSmall ? 14 : 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(isSmall ? 24 : 34),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              const spacing = 8.0;
                              final boxWidth =
                                  ((constraints.maxWidth -
                                              (spacing *
                                                  (VerifyOtpController.otpLength -
                                                      1))) /
                                          VerifyOtpController.otpLength)
                                      .clamp(42.0, 48.0);

                              return Wrap(
                                alignment: WrapAlignment.center,
                                spacing: spacing,
                                children:
                                    List.generate(VerifyOtpController.otpLength,
                                        (index) {
                                  return SizedBox(
                                    width: boxWidth,
                                    height: 50,
                                    child: TextField(
                                      controller: controller.otpControllers[index],
                                      focusNode: controller.otpFocusNodes[index],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      maxLength: 1,
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        controller.onOtpChanged(index, value);
                                      },
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.pink,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                          const Gap(18),
                          Obx(() {
                            final seconds = controller.remainingSeconds.value;
                            final formatted = '00:${seconds.toString().padLeft(2, '0')}';
                            return Text(
                              'Code expires in $formatted',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: isSmall ? 13 : 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            );
                          }),
                          Gap(isSmall ? 16 : 20),
                          Obx(
                            () => CustomButton(
                              text: 'Verify',
                              isLoading: controller.isLoading.value,
                              onPressed: controller.verifyOtp,
                            ),
                          ),
                          Gap(isSmall ? 16 : 20),
                          Obx(
                            () => CustomButton(
                              text: controller.isResending.value
                                  ? 'Sending...'
                                  : 'Send again',
                              backgroundColor: Colors.white,
                              textColor: controller.remainingSeconds.value > 0
                                  ? Colors.grey
                                  : AppColors.primary,
                              borderColor: controller.remainingSeconds.value > 0
                                  ? Colors.grey
                                  : AppColors.primary,
                              onPressed:
                                  (controller.isResending.value ||
                                          controller.remainingSeconds.value > 0)
                                      ? () {}
                                      : controller.resendOtp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
