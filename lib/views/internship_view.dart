import 'package:codeit_app/views/support_view.dart';
import 'package:codeit_app/widgets/support_ticket_form_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternshipView extends StatelessWidget {
  const InternshipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(title: const Text('CODEIT')),
      body: SupportTicketFormContent(
        initialCategory: 'Internship Support',
        onHomeTap: () => Get.offAll(() => const SupportView()),
      ),
    );
  }
}
