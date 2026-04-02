import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/login_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  //w3
                  Text(
                    "Please enter your new password",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Gap(34),

                  //w4 email
                  CustomTextField(
                    labelText: "Email Address",
                    hintText: "Enter your email address",
                  ),

                  Gap(20),
                  //w5 password
                  CustomTextField(
                    labelText: "New Password",
                    hintText: "Enter your new password",
                    suffixIcon: Icon(Icons.visibility),
                  ),

                  Gap(20),

                  //w6 confirm password
                  CustomTextField(
                    labelText: "Confirm Password",
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.visibility),
                  ),

                  Gap(20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your password must contain",
                        style: TextStyle(fontWeight: FontWeight.w600),
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
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Gap(20),

                  //w7 button
                  CustomButton(
                    text: "Save",
                    backgroundColor: Colors.white,
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                  ),
                  Gap(20),

                  //w8 cancel button
                  CustomTextButton(text: "Cancel", page: ChangePasswordView()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
