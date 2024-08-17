import 'package:flutter/material.dart';

// Define a custom Circular Icon Button widget
class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double iconSize;
  final double elevation;
  final EdgeInsetsGeometry padding;

  // Constructor
  CircularIconButton({
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.size = 48.0,
    this.iconSize = 24.0,
    this.elevation = 4.0,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, elevation),
            blurRadius: elevation,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: iconSize),
        onPressed: onPressed,
        padding: padding,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
