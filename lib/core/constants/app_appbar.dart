import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppAppBar {
  static PreferredSizeWidget build({
    String title = 'CODE IT',
    bool centerTitle = false,
  }) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.01,
          ),
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: const Color(0xFFf85604),
      foregroundColor: const Color(0xFFFFFFFF),
      elevation: 6.0,
      shadowColor: Colors.black,
    );
  }
}