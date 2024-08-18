import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUiHelper {
  Text customText(
      String content, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      content,
      style: GoogleFonts.blinker(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
