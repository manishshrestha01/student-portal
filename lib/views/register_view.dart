import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/login_view.dart';
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
          child: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
            
                  //w3
                  Text(
                    "Join Code IT Student Portal",
                    style: TextStyle(color: AppColors.textLight, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
            
                  SizedBox(height: 30),
            
                  //w4 full name label
                 Row(
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 3),

                      Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
            
                  //w5 fullname input
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
            
                  SizedBox(height: 10),

                   //w6 email label
                  Row(
                    children: [
                      Text(
                    "Email Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 3),

                  Text("*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),

                  //w7 email input
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                   //w8 number label
                  Row(
                    children: [
                      Text(
                        "WhatsApp Number",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 3),

                      Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  //w9 number input
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "WhatsApp Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //w10
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                        SizedBox(width: 3,),
                      Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
            
                  //w11 password field
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility),
                      ),
                    ),
                  ),
            
                  SizedBox(height: 10),
            
                        
                  //w12 button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
            
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,
                      fontSize: 16                    
                      ),),
                    ),
                  ),
            
                  SizedBox(height: 20),
            
                  //w13 row
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
            
                  //w14
                  Text("@ 2026 Code IT. All rights reserved.", style: TextStyle(color: Colors.grey.shade800, fontSize: 14), textAlign: TextAlign.center, )
            
            
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
