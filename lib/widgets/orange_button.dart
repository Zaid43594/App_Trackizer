import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/style/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color colorbutton;
  final Color colorborder;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double widthborder;
  final TextStyle style;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.colorbutton,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.colorborder,
    required this.widthborder,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: colorborder, width: widthborder),
        boxShadow: [
          BoxShadow(
            color: colorbutton.withOpacity(0.6),
            blurRadius: 25,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorbutton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          elevation: 0,
          shadowColor: ColorsApp.transcolor,
        ),
        onPressed: onPressed,
        child: Text(text, style: style),
      ),
    );
  }
}
