import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/certificates_controller.dart';
import 'package:codeit_app/controller/change_password_controller.dart';
import 'package:codeit_app/controller/courses_controller.dart';
import 'package:codeit_app/controller/email_certificates_controller.dart';
import 'package:codeit_app/controller/forgot_password_controller.dart';
import 'package:codeit_app/controller/suggestion_controller.dart';
import 'package:codeit_app/controller/support_controller.dart';
import 'package:codeit_app/controller/terms_controller.dart';
import 'package:codeit_app/controller/ticket_controller.dart';
import 'package:codeit_app/controller/verify_otp_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
      permanent: true,
    );
    Get.put<TicketController>(TicketController(), permanent: true);
    Get.put<TermsController>(TermsController(), permanent: true);
    Get.put<CertificatesController>(CertificatesController(), permanent: true);
    Get.put<CoursesController>(CoursesController(), permanent: true);
    Get.put<EmailCertificatesController>(EmailCertificatesController(), permanent: true);
    Get.put<SuggestionController>(SuggestionController(), permanent: true);
    Get.put<SupportController>(SupportController(), permanent: true);
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController(), fenix: true);
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
      fenix: true,
    );
  }
}
