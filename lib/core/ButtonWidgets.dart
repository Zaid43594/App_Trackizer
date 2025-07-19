

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double sizetext;
  final Color colortext;
  final Color color;
  final Color colorborder;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double widthborder;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.sizetext,
    required this.colortext,
    required this.colorborder,
    required this.widthborder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          color: colorborder,
          width: widthborder,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 25,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child:
        
         CustomStyletext(
          text: text,
          size: sizetext,
          color: colortext,
        ),
      ),
    );
  }
}
class CustomStyletext extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const CustomStyletext({
    super.key,
    required this.text,
    required this.color,
    required this.size,
  
  });
   @override
  Widget build(BuildContext context) {
    return Text(
text , style:  GoogleFonts.inter(
                        color: color,
                        fontSize: size,
    ));
}}