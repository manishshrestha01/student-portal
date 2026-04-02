import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code IT", style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
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
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                      ),
                      Gap(10),

                      //w4 email
                      CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter your email address",
                      ),
                      Gap(20),

                      //w5 number
                      CustomTextField(
                        labelText: "WhatsApp Number",
                        keyboardType: TextInputType.numberWithOptions(),
                        hintText: "WhatsApp Number",
                      ),
                      Gap(20),

                      //w6 address
                      CustomTextField(
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
                            onPressed: () {},
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
                      CustomTextField(
                        labelText: "Current Password",
                        hintText: "Enter your current password",
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: AppColors.textLight,
                        ),
                        obscureText: true,
                      ),
                      Gap(20),

                      //w4 new password
                      CustomTextField(
                        labelText: "New Password",
                        hintText: "Enter your new password",
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: AppColors.textLight,
                        ),
                        obscureText: true,
                      ),
                      Gap(20),

                      //w5 confirm password
                      CustomTextField(
                        labelText: "Confirm New Password",
                        hintText: "Confirm new password",
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: AppColors.textLight,
                        ),
                        obscureText: true,
                      ),
                      Gap(20),

                      //w6 button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 192,
                          height: 44,
                          child: ElevatedButton.icon(
                            onPressed: () {},
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
      ),
    );
  }
}
