import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/login_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
                  Image.asset('assets/images/code-it-logo.png', height: 40,),
                  SizedBox(height: 20),
            
                  //w2
                  Text(
                    'Create a student account',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
            
                  //w3
                  Text(
                    "Join Code IT Student Portal",
                    style: TextStyle(color: AppColors.textLight, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
            
                  SizedBox(height: 30),
            
                  //w4 fullname 
                   CustomTextField(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full Name",
                    isRequired: true,
                    hintText: "Enter your full name",
                  ),
                  SizedBox(height: 10),
                 
            
                  //w5 email 
              CustomTextField(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email Address",
                    isRequired: true,
                    hintText: "Enter your email address",
                  ),
                  SizedBox(height: 10),
                 
                   //w6 number 
                CustomTextField(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "WhatsApp Number",
                  isRequired: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  hintText: "WhatsApp Number"),
                  SizedBox(height: 10),
            
                  //w7
                    CustomTextField(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    isRequired: true,
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  SizedBox(height: 10),
                 
            
                        
                  //w8 button
                  CustomButton(
                    text: "Create Account", onPressed: (){}),
            
                  SizedBox(height: 20),
            
                  //w9 row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Text("Already have an account?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
                      TextButton(onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginView(),)
                        );
                      }, child: Text("Sign in", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500,fontSize: 16, decoration: TextDecoration.underline,decorationColor: AppColors.primary, decorationThickness: 2, ),))
                    ],
                  ),
            
                  SizedBox(height: 40),
            
                  //w10
                  Text("@ 2026 Code IT. All rights reserved.", style: TextStyle(color: Colors.grey.shade800, fontSize: 14), textAlign: TextAlign.center, ),
            
           
            
                ],
              ),
            ),
          ),
           
        ),
      ),

    );
  }
}
