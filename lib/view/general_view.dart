import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/support_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:codeit_app/widgets/support_ticket_form_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SupportTicketFormContent(
        initialCategory: 'General',
        onHomeTap: () => Get.offAll(() => HomeView()),
        onSupportTap: () => Get.offAll(() => SupportView()),
      ),
    );
  }
}
