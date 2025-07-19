
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldyWidget extends StatelessWidget {

final TextEditingController controller;
final bool obscure;
final TextInputType keyboardtype;
final double size;
final double borderRadius;

   CustomTextFormFieldyWidget({
    required this.borderRadius,
    required this.keyboardtype,
    required this.obscure,
    required this.controller, 
    required this.size,
  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: controller,
                obscureText: obscure,
                keyboardType: keyboardtype,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.inter(fontSize: size),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              );
  }
}
