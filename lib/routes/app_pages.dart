import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/view/change_password.dart';
import 'package:codeit_app/view/forgot_password_view.dart';
import 'package:codeit_app/view/login_view.dart';
import 'package:codeit_app/view/profile_view.dart';
import 'package:codeit_app/view/register_view.dart';
import 'package:codeit_app/view/splash_view.dart';
import 'package:codeit_app/view/suggestions_view.dart';
import 'package:codeit_app/view/support_view.dart';
import 'package:codeit_app/view/ticket_view.dart';
import 'package:codeit_app/view/verify_otp.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
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

    GetPage(name: AppRoutes.profile, page: () => const ProfileView()),
    GetPage(name: AppRoutes.support, page: () => const SupportView()),
    GetPage(name: AppRoutes.ticket, page: () => const TicketView()),
    GetPage(name: AppRoutes.suggestions, page: () => const SuggestionsView()),
     GetPage(name: AppRoutes.sendTicket, page: () => const SupportView()),
  ];
}
