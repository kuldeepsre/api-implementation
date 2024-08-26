import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Set the color of the arc
      ..style = PaintingStyle.fill; // Fill the arc

    // Define the rectangle for the arc's bounding box
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // Draw the arc (only the top half)
    canvas.drawArc(rect, 3.14, 3.14, true, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
