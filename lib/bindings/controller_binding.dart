import 'package:codeit_app/controller/auth_controller.dart';
import 'package:codeit_app/controller/certificates_controller.dart';
import 'package:codeit_app/controller/change_password_controller.dart';
import 'package:codeit_app/controller/course_video_controller.dart';
import 'package:codeit_app/controller/courses_controller.dart';
import 'package:codeit_app/controller/email_certificates_controller.dart';
import 'package:codeit_app/controller/forgot_password_controller.dart';
import 'package:codeit_app/controller/link_controller.dart';
import 'package:codeit_app/controller/network_controller.dart';
import 'package:codeit_app/controller/notes_controller.dart';
import 'package:codeit_app/controller/recorded%20videos/recorded_controller.dart';
import 'package:codeit_app/controller/recorded%20videos/show_controller.dart';
import 'package:codeit_app/controller/recorded%20videos/store_controller.dart';
import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/controller/suggestion_controller.dart';
import 'package:codeit_app/controller/support_controller.dart';
import 'package:codeit_app/controller/terms_controller.dart';
import 'package:codeit_app/controller/ticket_controller.dart';
import 'package:codeit_app/controller/upcoming%20course/admission_controller.dart';
import 'package:codeit_app/controller/upcoming%20course/upcoming_controller.dart';
import 'package:codeit_app/controller/verify_otp_controller.dart';
import 'package:codeit_app/controller/video_player_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<StorageController>(StorageController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
      permanent: true,
    );
    Get.put<TicketController>(TicketController(), permanent: true);
    Get.put<TermsController>(TermsController(), permanent: true);
    Get.put<CertificatesController>(CertificatesController(), permanent: true);
    Get.put<UpcomingController>(UpcomingController(), permanent: true);
    Get.put<RecordedController>(RecordedController(), permanent: true);
    Get.put<ShowController>(ShowController(), permanent: true);
    Get.put<StoreController>(StoreController(), permanent: true);
    Get.put<CoursesController>(CoursesController(), permanent: true);
    Get.put<AdmissionController>(AdmissionController(), permanent: true);
    Get.put<EmailCertificatesController>(EmailCertificatesController(), permanent: true);
    Get.put<LinkController>(LinkController(), permanent: true);
    Get.put<NotesController>(NotesController(), permanent: true);
     Get.put<VideoPlayerController>(VideoPlayerController(), permanent: true);
    Get.put<CourseVideoController>(CourseVideoController(), permanent: true);
    Get.put<SuggestionController>(SuggestionController(), permanent: true);
    Get.put<SupportController>(SupportController(), permanent: true);
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController(), fenix: true);
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
      fenix: true,
    );
  }
}
