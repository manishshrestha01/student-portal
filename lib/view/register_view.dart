import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/utils/validators.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_phonefield.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SingleChildScrollView(
              child: CustomFormContainer(
                child: Form(
                  key: key,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmall = constraints.maxWidth < 390;
          
                      return Column(
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
                                'Create a student account',
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
                                'Join Code IT Student Portal',
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
                          controller: controller.name,
                          labelText: 'Full Name',
                          isRequired: true,
                          hintText: 'Enter your full name',
                          validator: (value) =>
                              value!.isEmpty ? 'Full name is required' : null,
                        ),
                        Gap(isSmall ? 10 : 12),
                        CustomTextField(
                          controller: controller.email,
                          labelText: 'Email Address',
                          isRequired: true,
                          hintText: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.emailValidator,
                        ),
                        Gap(isSmall ? 16 : 20),
                        CustomPhoneField(
                          controller: controller.whatsapp,
                          countryCodeController: controller.countryCode,
                          labelText: 'WhatsApp Number',
                          isRequired: true,
                          requiredMessage: 'WhatsApp Number is required',
                        ),
                        Gap(isSmall ? 16 : 20),
                        Obx(() {
                          return CustomTextField(
                            controller: controller.password,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            isRequired: true,
                            obscureText: controller.isPasswordHidden.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.isPasswordHidden.value =
                                    !controller.isPasswordHidden.value;
                              },
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Password is required' : null,
                          );
                        }),
                        Gap(isSmall ? 16 : 20),
                        CustomButton(
                          text: 'Create Account',
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              controller.register();
                            }
                          },
                        ),
                        Gap(isSmall ? 16 : 20),
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 8,
                          spacing: 12,
                          children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: isSmall ? 14 : 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                            CustomTextButton(
                              clearForm: controller.clearForm,
                              text: 'Log in',
                              routeName: AppRoutes.login,
                            ),
                          ],
                        ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
