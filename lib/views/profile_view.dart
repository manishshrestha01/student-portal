import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/views/change_password_view.dart';
import 'package:codeit_app/widgets/custom_button.dart';
import 'package:codeit_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code IT", style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //w1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               
                children: [
                  Text(
                    "Profile Setting",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Manage your account information",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),

              //w2
              Center(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.all(15),
                 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Icon(Icons.circle, color: AppColors.primary, size: 80),
                      Text(
                        "Hem Raj Ojha",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Student",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Change Profile Picture",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //w3
              Center(
                child: Container(
                  
                   margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.all(15),
                
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Form(
                    child: Column(
                      
                      children: [
                        Text(
                          "Update Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          labelText: "Full Name",
                          hintText: "Enter your full name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          labelText: "Email Address",
                          hintText: "Enter your email address",
                          prefixIcon: Icon(Icons.email),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          labelText: "Phone Number",
                          hintText: "Enter your phone number",
                          prefixIcon: Icon(Icons.phone),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          labelText: "Location",
                          hintText: "Enter your address",
                          prefixIcon: Icon(Icons.location_city),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          labelText: "Date of Birth",
                          hintText: "Enter your date of birth",
                          prefixIcon: Icon(Icons.date_range),
                        ),
                    
                        SizedBox(height: 20),
                        CustomButton(text: "Save Changes", onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),

              //w4
              Center(
                child: Container(
                   margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.all(15),
                
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Text(
                        "Security",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordView(),
                              ),
                            );
                          },
                          hoverColor: Colors.grey.shade200,
                          splashColor: Colors.blue.shade100,
                          highlightColor: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            margin: EdgeInsets.all(12),

                            child: Row(
                              children: [
                                Icon(Icons.lock),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Change Password",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Update your password",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Material(
                         color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordView(),
                              ),
                            );
                          },
                          hoverColor: Colors.grey.shade200,
                          splashColor: Colors.blue.shade100,
                          highlightColor: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Sign out of your account",
                                       style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
