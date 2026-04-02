import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/views/change_password_view.dart';
import 'package:codeit_app/views/forgot_password_view.dart';
import 'package:codeit_app/views/login_view.dart';
import 'package:codeit_app/views/profile_view.dart';
import 'package:codeit_app/views/register_view.dart';
import 'package:codeit_app/views/splash_view.dart';
import 'package:codeit_app/views/verify_otp_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes =[
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(name: AppRoutes.verifyOtp, page: () => const VerifyOtpView()),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
    ),

    GetPage(name: AppRoutes.profile, page: () => const ProfileView())
  ];
}