import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/utils/biometric_auth.dart';
import 'package:codeit_app/utils/dio_connector.dart';
import 'package:codeit_app/utils/validators.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final biometricAuth = BiometricAuth();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                        key: key,
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
                              'Welcome back!',
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
                              'Log in to your email address',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: isSmall ? 14 : 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(isSmall ? 24 : 34),
                            CustomTextField(
                              controller: controller.email,
                              labelText: 'Email Address',
                              isRequired: true,
                              hintText: 'Enter your email address',
                              validator: Validators.emailValidator,
                            ),
                            Gap(isSmall ? 16 : 20),
                            Obx(() {
                              return CustomTextField(
                                controller: controller.password,
                                labelText: 'Password',
                                isRequired: true,
                                hintText: 'Enter your password',
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
                                validator: (value) =>
                                    value!.isEmpty ? 'Password is required' : null,
                              );
                            }),
                            Gap(isSmall ? 16 : 20),
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 8,
                              spacing: 12,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        value: controller.rememberMe.value,
                                        activeColor: AppColors.primary,
                                        checkColor: Colors.white,
                                        onChanged: (value) {
                                          controller.rememberMe.value = value!;
                                        },
                                      ),
                                    ),
                                    Text(
                                      'Remember me',
                                      style: TextStyle(
                                        fontSize: isSmall ? 14 : 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomTextButton(
                                  text: 'Forgot Password?',
                                  routeName: AppRoutes.forgotPassword,
                                ),
                              ],
                            ),
                            Gap(isSmall ? 16 : 20),
                            CustomButton(
                              text: 'Log in',
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  controller.login();
                                }
                              },
                            ),
                            Gap(isSmall ? 16 : 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: Colors.grey[200], thickness: 1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'or continue with',
                                    style: TextStyle(
                                      fontSize: isSmall ? 12 : 14,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(color: Colors.grey[200], thickness: 1),
                                ),
                              ],
                            ),
                            const Gap(20),
                            InkWell(
                              onTap: () async {
                                final networkController = Get.find<NetworkController>();
                                if (!await networkController.checkConnectivity()) return;

                                final isEnabled =
                                    controller.storageController.biometricEnabled.value;
                                final token = controller.storageController.getToken();

                                if (!isEnabled) {
                                  Get.snackbar(
                                    'Info',
                                    'Please log in with email & password first to enable biometrics',
                                    backgroundColor: Colors.orange,
                                    colorText: Colors.white,
                                  );
                                  return;
                                }

                                final result = await biometricAuth.authenticateUser();
                                if (result) {
                                  if (token != null) {
                                    DioConnector.dio.options.headers['Authorization'] =
                                        'Bearer $token';
                                    await controller.fetchUser();
                                    Get.offAllNamed(AppRoutes.home);
                                  } else {
                                    Get.snackbar(
                                      'Info',
                                      'Please log in with email & password first',
                                      backgroundColor: Colors.orange,
                                      colorText: Colors.white,
                                    );
                                  }
                                } else {
                                  Get.snackbar('Failed', 'Authentication failed', backgroundColor: Colors.red, colorText: Colors.white);
                                }
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.06),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(alpha: 0.15),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.fingerprint,
                                      color: AppColors.primary,
                                      size: 22,
                                    ),
                                    const Gap(8),
                                    Flexible(
                                      child: Text(
                                        'Use Biometrics',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: isSmall ? 15 : 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(24),
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 8,
                              spacing: 12,
                              children: [
                                Text(
                                  "Don't have an account yet?",
                                  style: TextStyle(
                                    fontSize: isSmall ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                CustomTextButton(
                                  clearForm: controller.clearForm,
                                  text: 'Create Account',
                                  routeName: AppRoutes.register,
                                ),
                              ],
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
