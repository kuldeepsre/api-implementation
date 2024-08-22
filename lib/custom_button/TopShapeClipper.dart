import 'package:flutter/cupertino.dart';

class TopShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 10); // Start from the bottom
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 10); // Curve at the top
    path.lineTo(size.width, 0); // Line to the top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}