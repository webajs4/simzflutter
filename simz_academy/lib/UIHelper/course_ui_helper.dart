import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseUiHelper {
  Text customText(
      String content, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      content,
      style: GoogleFonts.blinker(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      overflow: TextOverflow.ellipsis, // Set the overflow property
    );
  }
}
