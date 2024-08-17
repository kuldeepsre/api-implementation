import 'package:flutter/material.dart';

// Define a custom Nuroprism Card View widget
class NuroprismCardView extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  // Constructor
  NuroprismCardView({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.gradientColors = const [Colors.purple, Colors.blue],
    this.borderRadius = 16.0,
    this.elevation = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: padding,
            child: Row(
              children: <Widget>[
                Icon(icon, size: 40.0, color: Colors.white),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
