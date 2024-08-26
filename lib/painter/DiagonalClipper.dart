import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at the bottom left corner
    path.lineTo(size.width, size.height / 2); // Draw a line to the middle right
    path.lineTo(size.width, 0); // Draw a line to the top right corner
    path.close(); // Close the path to form a triangle
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Return false as this clipper does not need re-clipping
  }
}
