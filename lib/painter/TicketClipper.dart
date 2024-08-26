import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double notchSize = 20.0; // Size of the notch for the ticket
    // Start from top-left corner
    path.moveTo(0, 0);
    // Draw line to top-right corner
    path.lineTo(size.width, 0);
    // Draw line to right-notch start
    path.lineTo(size.width, size.height / 2 - notchSize / 2);
    // Draw semi-circle notch on the right
    path.arcToPoint(
      Offset(size.width, size.height / 2 + notchSize / 2),
      radius: const Radius.circular(notchSize / 2),
      clockwise: false,
    );
    // Draw line to bottom-right corner
    path.lineTo(size.width, size.height);
    // Draw line to bottom-left corner
    path.lineTo(0, size.height);
    // Draw line to left-notch start
    path.lineTo(0, size.height / 2 + notchSize / 2);
    // Draw semicircle notch on the left
    path.arcToPoint(
      Offset(0, size.height / 2 - notchSize / 2),
      radius: const Radius.circular(notchSize / 2),
      clockwise: false,
    );
    // Close the path to top-left corner
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Return false as this clipper does not need re-clipping
  }
}
