// text_styles.dart
import 'package:flutter/material.dart';

// Utility function to convert hex color string to Color
Color hexToColor(String hex) {
  final buffer = StringBuffer();
  if (hex.length == 6 || hex.length == 7) buffer.write('FF');
  buffer.write(hex.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class TextStyles {
  // Example text styles with color parameter
  static TextStyle heading1(String hexColor) => TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: hexToColor(hexColor),
  );

  static TextStyle heading2(String hexColor) => TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: hexToColor(hexColor),
  );

  static TextStyle bodyText1(String hexColor) => TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: hexToColor(hexColor),
  );

  static TextStyle bodyText2(String hexColor) => TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: hexToColor(hexColor),
  );

  static TextStyle caption(String hexColor) => TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: hexToColor(hexColor),
  );

  // Predefined colors using hex codes
  static TextStyle heading1Primary = heading1('#000000'); // Black
  static TextStyle heading2Primary = heading2('#333333'); // Dark Gray
  static TextStyle bodyText1Primary = bodyText1('#666666'); // Medium Gray
  static TextStyle bodyText2Primary = bodyText2('#999999'); // Light Gray
  static TextStyle captionPrimary = caption('#cccccc'); // Very Light Gray

  static TextStyle heading1Accent = heading1('#007bff'); // Blue
  static TextStyle heading2Accent = heading2('#6610f2'); // Purple
  static TextStyle bodyText1Accent = bodyText1('#28a745'); // Green
  static TextStyle bodyText2Accent = bodyText2('#fd7e14'); // Orange
  static TextStyle captionAccent = caption('#17a2b8'); // Teal
}
