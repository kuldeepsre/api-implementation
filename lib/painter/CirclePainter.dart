import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint properties
    final paint = Paint()
      ..color = Colors.red // Set the color of the circle
      ..style = PaintingStyle.fill; // Fill the circle

    // Define the center and radius of the circle
    final center = Offset(size.width / 2, size.height / 2); // Center of the canvas
    final radius = 50.0; // Radius of the circle

    // Draw the circle on the canvas
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Return false as this painter does not need repainting
  }
}
