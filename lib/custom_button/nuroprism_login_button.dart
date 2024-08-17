import 'package:flutter/material.dart';

// Define a custom Nuroprism Login Button widget
class NuroprismLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final List<Color> gradientColors;
  final double borderRadius;
  final double elevation;
  final double fontSize;
  final FontWeight fontWeight;

  // Constructor
  NuroprismLoginButton({
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.gradientColors = const [Colors.purple, Colors.blue],
    this.borderRadius = 12.0,
    this.elevation = 8.0,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, elevation),
            blurRadius: elevation,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent, // Transparent background
          onPrimary: textColor, // Text color
          padding: EdgeInsets.all(0), // No additional padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
          ),
          elevation: 0, // Disable button's default shadow
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
