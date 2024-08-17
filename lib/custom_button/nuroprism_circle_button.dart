import 'package:flutter/material.dart';

// Define a custom Nuroprism Circular Button widget
class NuroprismCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  final List<Color> gradientColors;
  final double size;
  final double iconSize;
  final double borderWidth;
  final Color borderColor;
  final double elevation;

  // Constructor
  NuroprismCircleButton({
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.gradientColors = const [Colors.purple, Colors.blue],
    this.size = 60.0,
    this.iconSize = 30.0,
    this.borderWidth = 4.0,
    this.borderColor = Colors.white,
    this.elevation = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, elevation),
            blurRadius: elevation,
          ),
        ],
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: iconSize),
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
