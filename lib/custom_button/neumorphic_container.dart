import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double elevation;
  final Color backgroundColor;

  // Constructor
  NeumorphicContainer({
    required this.child,
    this.borderRadius = 12.0,
    this.elevation = 8.0,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(4, 4),
            blurRadius: elevation,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: Offset(-4, -4),
            blurRadius: elevation,
            spreadRadius: -2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
