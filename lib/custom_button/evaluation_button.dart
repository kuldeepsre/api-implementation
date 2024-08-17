import 'package:flutter/material.dart';

// Define a custom Evaluation Button widget
class EvaluationButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonColor;
  final double elevation;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  // Constructor
  EvaluationButton({
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.elevation = 4.0,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor, // Background color
        onPrimary: textColor, // Text color
        elevation: elevation, // Shadow elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
        ),
        padding: padding, // Padding inside the button
        shadowColor: Colors.black.withOpacity(0.5), // Shadow color
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
