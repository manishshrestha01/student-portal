import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/register_view.dart';
import 'package:codeit_app/views/forgot_password_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
                  //w1 logo
                  Image.asset('assets/images/code-it-logo.png', height: 40),
                  SizedBox(height: 20),
                    
                  //w2
                  Text(
                    'Welcome back!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                    
                  //w3
                  Text(
                    "Sign into your student portal",
                    style: TextStyle(color: AppColors.textLight, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                    
                  SizedBox(height: 30),
                    
                  //w4 email 
                  CustomTextField(
                    labelText: "Email Address",
                    isRequired: true,
                    hintText: "Enter your email address",
                    prefixIcon: Icon(Icons.email),
                    
                    ),
                  
                  SizedBox(height: 10),
                  //w5 password
                  CustomTextField(
                    labelText: "Password",
                    isRequired: true,
                    hintText: "Ente your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility),
                    ),
                  
                  SizedBox(height: 10),
                    
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
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordView(),
                              ),
                            );
                          },
                    
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    
                  SizedBox(height: 10),
                    
                  //w7 button
                CustomButton(text: "Sign in", onPressed: (){}),
                    
                  SizedBox(height: 20),
                    
                  //w8 row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterView(),
                            ),
                          );
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                    
                  SizedBox(height: 40),
                    
                  //w11
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
