import 'dart:math' as math;

import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/model/ticket_model.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/view/support_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/ticket_controller.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  final TicketController ticketController = Get.find<TicketController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ticketController.getTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Obx(() {
        if (ticketController.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
        }

        if (ticketController.errorMessage.value.isNotEmpty) {
          return _buildErrorView();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            return _buildPageContent(constraints.maxWidth);
          },
        );
      }),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ticketController.errorMessage.value,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: ticketController.getTickets,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(double screenWidth) {
    final bool isSmall = screenWidth < 390;
    final bool isMedium = screenWidth >= 390 && screenWidth < 768;
    final double horizontalPadding = isSmall ? 8 : (isMedium ? 16 : 32);
    final double contentWidth = math.min(
      screenWidth - (horizontalPadding * 2),
      screenWidth >= 1000 ? 960 : 620,
    );
    final List<Datum> tickets = ticketController.ticket.value.data;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(isSmall ? 24 : 32),
            _buildBreadcrumb(isSmall),
            Gap(isSmall ? 20 : 32),
            Text(
              'My Tickets',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.textDark,
                  fontSize: isSmall ? 22 : 25,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                ),
              ),
            ),
            Gap(isSmall ? 20 : 32),
            if (tickets.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    'No tickets found.',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontSize: isSmall ? 14 : 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            else
              Center(
                child: SizedBox(
                  width: contentWidth,
                  child: _buildTicketTable(tickets, isSmall, isMedium),
                ),
              ),
            Gap(isSmall ? 28 : 36),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumb(bool isMobile) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  AppColors.textLight,
                  BlendMode.srcIn,
                ),
              ),
              const Gap(8),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: AppColors.textLight,
                    fontSize: isMobile ? 13 : 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(7),
        Icon(
          Icons.chevron_right,
          color: AppColors.textDark,
          size: isMobile ? 18 : 20,
        ),
        const Gap(7),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Get.offAll(() => SupportView()),
          child: Text(
            'Support',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: AppColors.textDark,
                fontSize: isMobile ? 13 : 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const Gap(7),
        Icon(
          Icons.chevron_right,
          color: AppColors.textDark,
          size: isMobile ? 18 : 20,
        ),
        const Gap(7),
        Text(
          'My Tickets',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.textDark,
              fontSize: isMobile ? 13 : 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTicketTable(List<Datum> tickets, bool isSmall, bool isMedium) {
    final EdgeInsets cellPadding = EdgeInsets.symmetric(
      horizontal: isSmall ? 6 : (isMedium ? 12 : 28),
      vertical: isSmall ? 10 : (isMedium ? 14 : 20),
    );
    final double headerFontSize = isSmall ? 11 : (isMedium ? 13 : 14);
    const BorderRadius tableBorderRadius = BorderRadius.all(
      Radius.circular(22),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: tableBorderRadius,
        border: Border.all(color: const Color(0xFFC2C8D1), width: 1.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: tableBorderRadius,
        child: Column(
          children: [
            Container(
              color: const Color(0xFFF4F5F7),
              child: Padding(
                padding: cellPadding,
                child: Row(
                  children: [
                    _buildHeaderCell(
                      title: 'SUBJECT',
                      flex: 4,
                      fontSize: headerFontSize,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.left,
                    ),
                    _buildHeaderCell(
                      title: 'CATEGORY',
                      flex: 4,
                      fontSize: headerFontSize,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                    ),
                    _buildHeaderCell(
                      title: 'STATUS',
                      flex: 3,
                      fontSize: headerFontSize,
                      alignment: Alignment.centerRight,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xFFD4D7DD), thickness: 1, height: 1),
            for (int i = 0; i < tickets.length; i++)
              _buildTicketRow(
                tickets[i],
                isSmall,
                isMedium,
                cellPadding,
                i != tickets.length - 1,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell({
    required String title,
    required int flex,
    required double fontSize,
    required Alignment alignment,
    required TextAlign textAlign,
  }) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: alignment,
        child: Text(
          title,
          textAlign: textAlign,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color(0xFF667085),
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              letterSpacing: fontSize <= 13 ? 0.8 : 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketRow(
    Datum ticket,
    bool isSmall,
    bool isMedium,
    EdgeInsets cellPadding,
    bool showDivider,
  ) {
    final double subjectFontSize = isSmall ? 12 : (isMedium ? 15 : 15);
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: cellPadding,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ticket.subject ?? 'No subject',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: const Color(0xFF1F2937),
                          fontSize: subjectFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: _buildCategoryChip(
                        ticket.category,
                        isSmall,
                        isMedium,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: _buildStatusChip(ticket.status, isSmall, isMedium),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(color: Color(0xFFD4D7DD), thickness: 1, height: 1),
      ],
    );
  }

  Widget _buildCategoryChip(String? category, bool isSmall, bool isMedium) {
    final String value = (category ?? '').toLowerCase().trim();
    String label = _toTitleCase(category, 'General');
    String iconPath = 'assets/support/general_chip.svg';

    Color backgroundColor = const Color(0xFFE3ECFF);
    Color textColor = const Color(0xFF22408B);

    if (value.contains('general')) {
      label = 'General';
      iconPath = 'assets/support/general_chip.svg';
      backgroundColor = const Color(0xFFE3ECFF);
      textColor = const Color(0xFF22408B);
    } else if (value.contains('technical')) {
      label = 'Technical';
      iconPath = 'assets/support/technical_chip.svg';
      backgroundColor = const Color(0xFFFFE2E2);
      textColor = const Color(0xFF9E0812);
    } else if (value.contains('counseling')) {
      label = 'Counseling';
      iconPath = 'assets/support/counselling_chip.svg';
      backgroundColor = const Color(0xFFDCFCE6);
      textColor = const Color(0xFF016630);
    } else if (value.contains('internship')) {
      label = 'Internship';
      iconPath = 'assets/support/internship_chip.svg';
      backgroundColor = const Color(0xFFF3E7FF);
      textColor = const Color(0xFF6E10B0);
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: isSmall ? 110 : (isMedium ? 150 : 220),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : (isMedium ? 10 : 16),
        vertical: isSmall ? 4 : (isMedium ? 6 : 10),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: isSmall ? 13 : (isMedium ? 16 : 21),
            height: isSmall ? 13 : (isMedium ? 16 : 21),
            colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          Gap(isSmall ? 5 : (isMedium ? 7 : 10)),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: textColor,
                fontSize: isSmall ? 11 : (isMedium ? 13 : 14),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String? status, bool isSmall, bool isMedium) {
    final String value = (status ?? '').toLowerCase().trim();

    Color backgroundColor = const Color(0xFFE5E7EB);
    Color textColor = const Color(0xFF1F2937);

    if (value.contains('open') || value.contains('pending')) {
      backgroundColor = const Color(0xFFfff9c2);
      textColor = const Color(0xFF894b00);
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: isSmall ? 75 : (isMedium ? 95 : 150),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : (isMedium ? 10 : 18),
        vertical: isSmall ? 4 : (isMedium ? 6 : 10),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        _toTitleCase(status, 'Pending'),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: textColor,
            fontSize: isSmall ? 11 : (isMedium ? 13 : 14),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String _toTitleCase(String? value, String fallback) {
    if (value == null || value.trim().isEmpty) {
      return fallback;
    }

    final words = value
        .trim()
        .split(RegExp(r'[\s_-]+'))
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.length > 1 ? word.substring(1).toLowerCase() : ''}',
        )
        .toList();

    if (words.isEmpty) {
      return fallback;
    }

    return words.join(' ');
  }
}
