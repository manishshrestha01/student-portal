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
import 'package:google_fonts/google_fonts.dart';

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
                      child: Form(
                        key: formKey,
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
                              'Password recovery',
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
                              'Enter your email address to recover your password',
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
                            CustomTextField(
                              controller: controller.emailController,
                              labelText: 'Email Address',
                              isRequired: true,
                              hintText: 'Enter your email address',
                              keyboardType: TextInputType.emailAddress,
                              validator: Validators.emailValidator,
                            ),
                            Gap(isSmall ? 16 : 20),
                            Obx(
                              () => CustomButton(
                                text: 'Send OTP',
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
                            Gap(isSmall ? 16 : 20),
                            Center(
                          child: CustomTextButton(
                            text: 'Back to Login',
                            routeName: AppRoutes.login,
                          ),
                            ),
                          ],
                        ),
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
