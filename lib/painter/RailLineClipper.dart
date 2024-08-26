import 'package:flutter/material.dart';

class RailLineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double railWidth = 10.0; // Width of each rail
    const double tieHeight = 5.0;  // Height of each tie
    const double tieSpacing = 20.0; // Spacing between each tie

    // Draw the left rail
    path.addRect(Rect.fromLTWH(size.width * 0.3 - railWidth / 2, 0, railWidth, size.height));

    // Draw the right rail
    path.addRect(Rect.fromLTWH(size.width * 0.7 - railWidth / 2, 0, railWidth, size.height));

    // Draw the ties across the rails
    for (double y = 0; y < size.height; y += tieSpacing) {
      path.addRect(Rect.fromLTWH(size.width * 0.3 - railWidth / 2, y, size.width * 0.4 + railWidth, tieHeight));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Return false as this clipper does not need re-clipping
  }
}