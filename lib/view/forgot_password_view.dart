import 'package:codeit_app/controller/forgot_password_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/utils/validators.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //w1 logo
                  Image.asset(
                    'assets/images/code-it-logo.png',
                    height: 67,
                    width: 284,
                  ),
                  Gap(20),

                  //w2
                  Text(
                    'Password recovery',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  //w3
                  Text(
                    "Enter your email address to recover your password",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Gap(34),

                  //w4 email label
                  CustomTextField(
                    controller: controller.emailController,
                    labelText: "Email your registered email address",
                    hintText: "Enter your email address",
                    isRequired: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.emailValidator,
                  ),

                  Gap(20),
                  //w5 button
                  Obx(
                    () => CustomButton(
                      text: "Send OTP",
                      isLoading: controller.isLoading.value,
                      backgroundColor: Colors.white,
                      textColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.sendOtp();
                        }
                      },
                    ),
                  ),
                  Gap(20),

                  //w6
                  CustomTextButton(
                    text: "Back to Login",
                    routeName: AppRoutes.login,
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
