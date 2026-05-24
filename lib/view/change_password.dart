import 'package:codeit_app/controller/change_password_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                    'Reset your password',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  //w3
                  Text(
                    "Please enter your new password",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Gap(34),

                  Obx(
                    () => Text(
                      controller.email.value.isEmpty
                          ? "Email: (not available)"
                          : "Email: ${controller.email.value}",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Gap(20),
                  Obx(
                    () => CustomTextField(
                      labelText: "New Password",
                      hintText: "Enter your new password",
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                        },
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) {
                        final text = value?.trim() ?? '';
                        if (text.isEmpty) {
                          return 'Please enter new password';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),

                  Gap(20),

                  Obx(
                    () => CustomTextField(
                      labelText: "Confirm Password",
                      hintText: "Enter your password",
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isConfirmPasswordHidden.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isConfirmPasswordHidden.value =
                              !controller.isConfirmPasswordHidden.value;
                        },
                        icon: Icon(
                          controller.isConfirmPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) {
                        final text = value?.trim() ?? '';
                        if (text.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (text != controller.passwordController.text.trim()) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),

                  Gap(20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your password must contain",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          Gap(8),
                          Text(
                            "At least 6 characters",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: AppColors.textDark,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Gap(20),

                  //w7 button
                  Obx(
                    () => CustomButton(
                      text: "Save",
                      isLoading: controller.isLoading.value,
                      backgroundColor: Colors.white,
                      textColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.resetPassword();
                        }
                      },
                    ),
                  ),
                  Gap(20),

                  //w8 cancel button
                  CustomTextButton(
                    text: "Cancel",
                    routeName: AppRoutes.forgotPassword,
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
