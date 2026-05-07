import 'package:codeit_app/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Notes extends StatefulWidget {
  final dynamic id;
  const Notes({super.key, required this.id});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final NotesController noteController = Get.find<NotesController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      noteController.sendNote(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final notesList = noteController.note.value.notes;
      print("Notes Count: ${notesList.length}");

      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notes & Resources",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  if (notesList.isEmpty)
                    // Empty State
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 48,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Icon Container
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF0F1F5),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF5A5A5A,
                                  ).withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/support/note.svg',
                                width: 48,
                                height: 48,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFB0B0B0),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const Gap(24),

                          // Title Text
                          const Text(
                            "No notes or resources yet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                              letterSpacing: -0.3,
                            ),
                          ),
                          const Gap(12),

                          // Description Text
                          Text(
                            "Your mentor will upload important notes, PDFs, links, and other study materials here if available.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.6),
                              height: 1.5,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    // Notes List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notesList.length,
                      separatorBuilder: (context, index) => const Gap(16),
                      itemBuilder: (context, index) {
                        final note = notesList[index];
                        return GestureDetector(
                          onTap: () async {
                            if (note.notePdf != null &&
                                note.notePdf!.isNotEmpty) {
                              final pdfUrl =
                                  'https://mentor.codeit.com.np/storage/${note.notePdf}';
                              print("Opening PDF: $pdfUrl");
                              if (await canLaunchUrl(Uri.parse(pdfUrl))) {
                                await launchUrl(Uri.parse(pdfUrl));
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // File Icon
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0F1F5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/support/note.svg',
                                      width: 28,
                                      height: 28,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFFFF6900),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                // Note Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        note.noteTitle ?? "Untitled",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      const Gap(6),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/support/date.svg',
                                            width: 12,
                                            height: 12,
                                            colorFilter: const ColorFilter.mode(
                                              Color(0xB3000000),
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Gap(6),
                                          Text(
                                            note.postedOn ?? "Today",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.7,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(12),
                                // Arrow Icon
                                const Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFFB0B0B0),
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  const Gap(32),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
