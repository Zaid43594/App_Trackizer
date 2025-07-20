import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
 
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.color,
    this.padding,
   
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      color: color,
      padding: padding,
    );
  }
}
