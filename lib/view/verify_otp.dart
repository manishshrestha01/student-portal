import 'package:codeit_app/controller/verify_otp_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: CustomFormContainer(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/code-it-logo.png',
                    height: 67,
                    width: 284,
                  ),
                  Gap(20),

                  Text(
                    'Check your mail',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  Text(
                    "We've sent the code to your email",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Gap(34),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(VerifyOtpController.otpLength, (
                      index,
                    ) {
                      return Container(
                        width: 44,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: TextField(
                          controller: controller.otpControllers[index],
                          focusNode: controller.otpFocusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (value) {
                            controller.onOtpChanged(index, value);
                          },
                          decoration: InputDecoration(
                            counterText: "",
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
                              borderSide: BorderSide(color: Colors.pink),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  Text(
                    "Code expires in 00:59",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Gap(20),
                  Obx(
                    () => CustomButton(
                      text: "Verify",
                      isLoading: controller.isLoading.value,
                      onPressed: controller.verifyOtp,
                    ),
                  ),
                  Gap(20),

                  Obx(
                    () => CustomButton(
                      text: controller.isResending.value
                          ? "Sending..."
                          : "Send again",
                      backgroundColor: Colors.white,
                      textColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      onPressed: controller.isResending.value
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
  }
}
