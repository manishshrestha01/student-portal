import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/login_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_form_container.dart';
import 'package:codeit_app/widgets/custom_text_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
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
                    labelText: "Full Name",
                    isRequired: true,
                    hintText: "Enter your full name",
                  ),
                  Gap(10),

                  //w5 email
                  CustomTextField(
                    labelText: "Email Address",
                    isRequired: true,
                    hintText: "Enter your email address",
                  ),
                  Gap(20),

                  //w6 number
                  CustomTextField(
                    labelText: "WhatsApp Number",
                    isRequired: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    hintText: "WhatsApp Number",
                  ),
                  Gap(20),

                  //w7
                  CustomTextField(
                    labelText: "Password",
                    isRequired: true,
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  Gap(20),

                  //w8 button
                  CustomButton(text: "Create Account", onPressed: () {}),

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
                     CustomTextButton(text: "Log in", page: LoginView())
                    ],
                  ),
                ],
              ),
            ),
          
          )
        ),
      ),
    );
  }
}
