import 'package:flutter/material.dart';

class CustomGestureDetector extends StatelessWidget {
  final String path;
  final double height;
  final width;
  final VoidCallback onTap;
  final Color color;
  CustomGestureDetector({
    super.key,
     this.height = 25,
     this.width = 25,
    required this.path,
    required this.onTap,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset(
          path,
          height: height,
          width: width,
          color: color,
        ));
  }
}