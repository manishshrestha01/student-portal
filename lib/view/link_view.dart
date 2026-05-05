import 'package:codeit_app/controller/link_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkView extends StatefulWidget {
  const LinkView({super.key});

  @override
  State<LinkView> createState() => _LinkViewState();
}

class _LinkViewState extends State<LinkView> {
  final LinkController linkController = Get.find<LinkController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      linkController.getLinks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final linksList = linkController.link.value.data;
      print("links Count: ${linksList.length}");
      if (linksList.isEmpty) {
        return const SizedBox.shrink();
      }

      final item = linksList.first;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFFFFFFF)),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(64),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text("${item.courseName}"),
            Text("${item.mentorName}"),
            Text("${item.classTime}"),
            ElevatedButton(onPressed: () {}, child: Text("Join Live Class")),
          ],
        ),
      );
    });
  }
}
