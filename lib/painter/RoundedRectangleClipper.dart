import 'package:flutter/material.dart';

class RoundedRectangleClipper extends CustomClipper<Path> {
  final double borderRadius;

  RoundedRectangleClipper({required this.borderRadius});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Define the rounded rectangle path
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Return false as this clipper does not need re-clipping
  }
}
