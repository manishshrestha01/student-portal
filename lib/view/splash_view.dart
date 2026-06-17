import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/code-it-logo.png',
              width: 150,
              height: 35,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: AppColors.primary,),
          ],
        ),
      ),
    );
  }
}
