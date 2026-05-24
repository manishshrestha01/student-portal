import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_view.dart';

class UpcomingClassesView extends StatefulWidget {
  const UpcomingClassesView({super.key});

  @override
  State<UpcomingClassesView> createState() => _UpcomingClassesViewState();
}

class _UpcomingClassesViewState extends State<UpcomingClassesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9fafb),
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(isSmall ? 24 : 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildBreadcrumb(isSmall),
                  ),
                  Gap(isSmall ? 24 : 32),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFffeee8,
                        ), 
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFfed1c0), 
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Next Batches Starting Soon',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Color(0xFFf85604),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(isSmall ? 24 : 32),
                  Center(
                    child: Text("Upcoming Classes in \nGoogle Meet",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 36,
                          ),
                        ),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBreadcrumb(bool isSmall) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.7),
                  BlendMode.srcIn,
                ),
              ),
              const Gap(8),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontSize: isSmall ? 13 : 15,
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
          color: const Color.fromRGBO(0, 0, 0, 0.9),
          size: isSmall ? 18 : 20,
        ),
        const Gap(7),
        Text(
          'Upcoming Classes',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color(0xFF000000),
              fontSize: isSmall ? 13 : 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
