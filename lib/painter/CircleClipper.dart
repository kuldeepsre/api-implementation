import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Calculate the center of the path
    final center = Offset(size.width / 2, size.height / 2);

    // Determine the radius for the circle
    final radius = size.width / 2;

    // Draw the circle path
    path.addOval(Rect.fromCircle(center: center, radius: radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Return false as this clipper does not need re-clipping
  }
}
