// Define a custom TextButton widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final BorderSide? borderSide;

  // Constructor
  CustomTextButton({
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.all(8.0),
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: textColor, // Text color
        backgroundColor: backgroundColor, // Button background color
        padding: padding, // Padding around the text
        side: borderSide, // Optional border
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}