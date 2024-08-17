import 'package:flutter/material.dart';

// Define a custom Outline Button widget
class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;

  // Constructor
  CustomOutlineButton({
    required this.text,
    required this.onPressed,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    this.margin = EdgeInsets.zero,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          primary: textColor, // Text color
          side: BorderSide(color: borderColor, width: borderWidth), // Border color and width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), // Border radius
          ),
          padding: padding, // Padding inside the button
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
