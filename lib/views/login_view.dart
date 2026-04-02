import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/register_view.dart';
import 'package:codeit_app/views/forgot_password_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: CustomFormContainer(child: Form(
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
                    'Welcome back!',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  //w3
                  Text(
                    "Log into your email address",
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
                    labelText: "Password",
                    hintText: "Enter your password",

                    suffixIcon: Icon(Icons.visibility),
                  ),

                  Gap(20),

                  //w6 row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: AppColors.primary,
                              checkColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Flexible(
                              child: Text(
                                "Remember me",
                                style: TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextButton(
                        text: "Forgot Password?",
                        page: ForgotPasswordView(),
                      ),
                    ],
                  ),

                  Gap(20),

                  //w7 button
                  CustomButton(text: "Log in", onPressed: () {}),

                  Gap(20),

                  //w8 row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CustomTextButton(
                        text: "Create Account",
                        page: RegisterView(),
                      ),
                    ],
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
