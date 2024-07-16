import 'package:flutter/material.dart';

class HomeUiHelper {
  TextStyle howdyText() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );
  }
}

Text customText(String content, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
            '$content',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          );
  }
