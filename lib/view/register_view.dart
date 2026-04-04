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

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                    'Create a student account',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  //w3
                  Text(
                    "Join Code IT Student Portal",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Gap(34),

                  //w4 fullname
                  CustomTextField(
                    controller: controller.name,
                    labelText: "Full Name",
                    isRequired: true,
                    hintText: "Enter your full name",
                    validator: (value) => value!.isEmpty ? "Full name is required" : null,
                  ),
                  Gap(10),

                  //w5 email
                  CustomTextField(
                    controller: controller.email,
                    labelText: "Email Address",
                    isRequired: true,
                    hintText: "Enter your email address",
                    keyboardType: TextInputType.emailAddress,
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

                  //w6 number
                  CustomTextField(
                    controller: controller.whatsapp,
                    labelText: "WhatsApp Number",
                    isRequired: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    hintText: "WhatsApp Number",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "WhatsApp number is required";
                      } else if (!GetUtils.isPhoneNumber(value)) {
                        return "Please enter a valid WhatsApp number";
                      }
                      return null;
                    },
                  ),
                  Gap(20),

                  //w7
                  CustomTextField(
                    controller: controller.password,
                    labelText: "Password",
                    isRequired: true,
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.visibility),
                    obscureText: true,
                    validator: (value) => value!.isEmpty ? "Password is required" : null
                  ),
                  Gap(20),

                  //w8 button
                  CustomButton(text: "Create Account", onPressed: () {
                    if (key.currentState!.validate()){
                    controller.register();
                      
                    }
                  }),

                  Gap(20),

                  //w9 row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CustomTextButton(
                        text: "Log in",
                        routeName: AppRoutes.login,
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
