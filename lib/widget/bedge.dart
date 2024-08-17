import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget badgeContent;
  final Widget child;

  Badge({required this.badgeContent, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.red,
            child: badgeContent,
          ),
        ),
      ],
    );
  }
}