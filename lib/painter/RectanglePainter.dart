import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint properties
    final paint = Paint()
      ..color = Colors.blue // Set the color of the rectangle
      ..style = PaintingStyle.fill; // Fill the rectangle

    // Define the rectangle
    final rect = Rect.fromLTWH(50, 50, 200, 100); // Position and size of the rectangle

    // Draw the rectangle on the canvas
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Return false as this painter does not need repainting
  }
}