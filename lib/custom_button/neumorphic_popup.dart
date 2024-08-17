import 'package:flutter/material.dart';

// Define a custom Neumorphic Dialog widget
class NeumorphicDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  // Constructor
  NeumorphicDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: NeumorphicContainer(
        borderRadius: 16.0,
        elevation: 8.0,
        backgroundColor: Colors.grey[300]!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onConfirm,
                    child: const Text('Confirm'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onCancel,
                    child: const Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Neumorphic Container for dialog background
class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double elevation;
  final Color backgroundColor;

  // Constructor
  NeumorphicContainer({
    required this.child,
    this.borderRadius = 12.0,
    this.elevation = 8.0,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4, 4),
            blurRadius: elevation,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(-4, -4),
            blurRadius: elevation,
            spreadRadius: -2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
