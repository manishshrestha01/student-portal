import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();

  return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: CustomFormContainer(
            child: Form(
              key: key,
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
                    controller: controller.email,
                    labelText: "Email Address",
                    hintText: "Enter your email address",
                     validator: (value) {
                      if (value!.isEmpty) {
                        return "Email address is required";
                      } else if (!GetUtils.isEmail(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),

                  Gap(20),
                  //w5 password
                  CustomTextField(
                    controller: controller.password,
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.visibility),
                    validator: (value) =>
                        value!.isEmpty ? "Password is required" : null,
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
                              value: false,
                              activeColor: AppColors.primary,
                              checkColor: Colors.white,
                              onChanged: (value) {
                                
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
                        routeName: AppRoutes.forgotPassword,
                      ),
                    ],
                  ),

                  Gap(20),

                  //w7 button
                  CustomButton(text: "Log in", 
                  
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      controller.login();
                    }
                  }),

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
    );
  }
}