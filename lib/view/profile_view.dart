import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/utils/validators.dart';
import 'package:codeit_app/view/support_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends GetView<AuthController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Obx(() {
        final user = controller.user.value;

        if (user != null) {
          controller.name.text = user.name ?? '';
          controller.email.text = user.email ?? '';
          controller.whatsapp.text = user.phone ?? '';
          controller.countryCode.text = user.countryCode ?? '';
        }

        return SingleChildScrollView(
          child: Column(
            children: [
                Gap(12),
              Row(
                children: [
                  Gap(18),
                  Column(
                    children: [
                      Gap(18),
                      _buildBreadcrumb(),
                       Gap(32),
                      Row(
                        children: [
                          Gap(18),
                          Text(
                            'Update Profile',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: AppColors.textDark,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                    ],
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    CustomFormContainer(
                      child: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //w1
                            Text(
                              'Update Your Profile',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(10),
                            //w2
                            Text(
                              "Keep your current information",
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(34),
                            //w3 fullname
                            CustomTextField(
                              controller: controller.name,
                              labelText: "Full Name",
                              hintText: "Enter your full name",
                            ),
                            Gap(10),
                            //w4 email
                            CustomTextField(
                              controller: controller.email,
                              labelText: "Email Address",
                              hintText: "Enter your email address",
                              validator: Validators.emailValidator,
                            ),
                            Gap(20),
                            //w5 number
                            CustomTextField(
                              controller: controller.whatsapp,
                              labelText: "WhatsApp Number",
                              keyboardType: TextInputType.numberWithOptions(),
                              hintText: "WhatsApp Number",
                            ),
                            Gap(20),
                            //w6 address
                            CustomTextField(
                              controller: controller.countryCode,
                              labelText: "Address",
                              hintText: "Enter your address",
                            ),
                            Gap(20),
                            //w7 button
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 192,
                                height: 44,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    await controller.updateProfile();
                                  },
                                  icon: const Icon(
                                    Icons.save,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Save Changes",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.textButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                          ],
                        ),
                      ),
                    ),
                    Gap(20),
                    CustomFormContainer(
                      child: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //w1
                            Text(
                              'Change Your Password',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(10),
                            //w2
                            Text(
                              "Keep your account secure",
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(34),
                            //w3 current password
                            Obx(() {
                              return CustomTextField(
                                controller: controller.currentPassword,
                                labelText: "Current Password",
                                hintText: "Enter your current password",
                                obscureText: controller.currentPasswordHidden.value,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.currentPasswordHidden.value =
                                        !controller.currentPasswordHidden.value;
                                  },
                                  icon: Icon(
                                    controller.currentPasswordHidden.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              );
                            }),
                            Gap(20),
                            //w4 new password
                            Obx(() {
                              return CustomTextField(
                                controller: controller.newPassword,
                                labelText: "New Password",
                                hintText: "Enter your new password",
                                obscureText: controller.newPasswordHidden.value,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.newPasswordHidden.value =
                                        !controller.newPasswordHidden.value;
                                  },
                                  icon: Icon(
                                    controller.newPasswordHidden.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              );
                            }),
                            Gap(20),
                            //w5 confirm password
                            Obx(() {
                              return CustomTextField(
                                controller: controller.confirmPassword,
                                labelText: "Confirm New Password",
                                hintText: "Confirm new password",
                                obscureText: controller.confirmPasswordHidden.value,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.confirmPasswordHidden.value =
                                        !controller.confirmPasswordHidden.value;
                                  },
                                  icon: Icon(
                                    controller.confirmPasswordHidden.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              );
                            }),
                            Gap(20),
                            //w6 button
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 192,
                                height: 44,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    await controller.resetPassword();
                                  },
                                  icon: const Icon(
                                    Icons.save,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Save Changes",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.textButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                          ],
                        ),
                      ),
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => const SupportView()),
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
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontSize: 15,
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
          color: const Color.fromRGBO(0, 0, 0, 0.9),
          size: 20,
        ),
        const Gap(7),
        Text(
          'Profile',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color(0xFF000000),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
