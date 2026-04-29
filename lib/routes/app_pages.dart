import 'package:codeit_app/controller/change_password_controller.dart';
import 'package:codeit_app/controller/verify_otp_controller.dart';
import 'package:codeit_app/routes/app_routes.dart';
import 'package:codeit_app/view/change_password.dart';
import 'package:codeit_app/view/forgot_password_view.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/login_view.dart';
import 'package:codeit_app/view/payment_page_view.dart';
import 'package:codeit_app/view/profile_view.dart';
import 'package:codeit_app/view/receipt_view.dart';
import 'package:codeit_app/view/register_view.dart';
import 'package:codeit_app/view/splash_view.dart';
import 'package:codeit_app/view/suggestions_view.dart';
import 'package:codeit_app/view/support_view.dart';
import 'package:codeit_app/view/terms_view.dart';
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
    GetPage(
      name: AppRoutes.verifyOtp,
      page: () => const VerifyOtpView(),
      binding: BindingsBuilder(() {
        if (!Get.isRegistered<VerifyOtpController>()) {
          Get.lazyPut<VerifyOtpController>(
            () => VerifyOtpController(),
            fenix: true,
          );
        }
      }),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
      binding: BindingsBuilder(() {
        if (!Get.isRegistered<ChangePasswordController>()) {
          Get.lazyPut<ChangePasswordController>(
            () => ChangePasswordController(),
            fenix: true,
          );
        }
      }),
    ),

    GetPage(name: AppRoutes.profile, page: () => ProfileView()),
    GetPage(name: AppRoutes.support, page: () => const SupportView()),
    GetPage(name: AppRoutes.ticket, page: () => const TicketView()),
    GetPage(name: AppRoutes.suggestions, page: () => const SuggestionsView()),
    GetPage(name: AppRoutes.sendTicket, page: () => const SupportView()),
    GetPage(name: AppRoutes.home, page: () =>  HomeView()),
    GetPage(name: AppRoutes.terms, page: () =>  TermsView()),
    GetPage(name: AppRoutes.receipt, page: () =>  ReceiptView()),
    GetPage(name: AppRoutes.payment, page: () =>  PaymentPage()),

  ];
}
