import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/style/colors.dart';

class TextForm extends StatelessWidget {
  // final TextEditingController mycontroller;
  // final String? errorText;
  // final bool isObscure;
  // final String? Function(String?)? validator;
  const TextForm({
    super.key,
    // required this.mycontroller,
    // this.errorText,
    // required this.isObscure,
    // this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 327.w,
      child: TextFormField(
        // validator: validator,
        // obscureText: isObscure,
        // controller: mycontroller,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
          color: ColorsApp.whiteapp,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ColorsApp.cardcolor, width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorsApp.cardcolor, width: 2.w),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }
}
