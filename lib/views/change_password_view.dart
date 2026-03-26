import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/forgot_password_view.dart';
import 'package:codeit_app/views/profile_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Code IT" ,style: TextStyle(color: Colors.white),), automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //w1 arrow with text
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordView()));
                    },
                    label: Icon(Icons.arrow_back, size: 16),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      minimumSize: Size(0, 0),
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      elevation: 1,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ),
        
                  SizedBox(width: 12),
        
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Change Password",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Update your account pasword",
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        
              //w2 box
              SizedBox(height: 20),
        
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 209, 244, 248),
        
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: 7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Security Tips",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("• Use at least 8 characters"),
                        Text("• Include uppercase and lowercase"),
                        Text("• Add numbers and special characters"),
                      ],
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
        
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
                      //w1 currentpassword
                      CustomTextField(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Current Password",
                        hintText: "Enter current password",
                        isRequired: true,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icon(Icons.visibility),
                      ),
                        
                      SizedBox(height: 14),
                      //w2 newpassword
                      CustomTextField(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "New Password",
                        hintText: "Enter new password",
                        isRequired: true,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icon(Icons.visibility),
                      ),
                      SizedBox(height: 14),
                      //w3 conform password
                      CustomTextField(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Confirm New Password",
                        hintText: "Re-enter new password",
                        isRequired: true,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icon(Icons.visibility),
                      ),
                        
                      SizedBox(height: 20),
                      //w4 button
                      CustomButton(text: "Update Password", onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                      }),
                        
                      SizedBox(height: 14),
                      //w5
                      Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
