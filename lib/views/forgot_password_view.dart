import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/change_password_view.dart';
import 'package:codeit_app/views/login_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.boxColor,
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x26000000),
                  offset: const Offset(0, 4),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //w1 arrow
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text("Back to Login"),
                      ),
                    ],
                  ),
                  
                  //w1 logo
                  Image.asset('assets/images/code-it-logo.png', height: 40),
                  SizedBox(height: 20),
                  
                  //w2
                  Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  
                  //w3
                  Text(
                    "Enter your email address and we'll send you a link to reset your password.",
                    style: TextStyle(color: AppColors.textLight, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 30),
                  
                  //w4 email label
                 CustomTextField(
                  labelText: "Email Address",
                  hintText: "Enter your email address",
                  isRequired: true,
                  prefixIcon: Icon(Icons.email),
                  ),
                 
                 SizedBox(height: 20),
                 //w5 button
                  CustomButton(text: "Send Reset Link", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordView()));
                  }),
                  SizedBox(height: 20),
                  
                  //w6
                  Text(
                    "@ 2026 Code IT. All rights reserved.",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                    textAlign: TextAlign.center,
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
