// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:trackizer/core/constants/colors.dart';

// class TextForm extends StatelessWidget {
//   final TextEditingController? controller;
//   final bool readOnly;
//   final TextAlign textAlign;

//   const TextForm({
//     super.key,
//     this.controller,
//     this.readOnly = false,
//     this.textAlign = TextAlign.start,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 48.h,
//       width: 327.w,
//       child: TextFormField(
//         controller: controller,
//         readOnly: readOnly,
//         textAlign: textAlign,
//         style: TextStyle(
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.normal,
//           color: ColorsApp.whiteapp,
//         ),
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16.r),
//             borderSide: BorderSide(color: ColorsApp.cardcolor, width: 1.5.w),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.r),
//             borderSide: BorderSide(color: ColorsApp.cardcolor, width: 2.w),
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 16.w,
//             vertical: 14.h,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final bool obscureText;
  final String hintText;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.hintText = '',
    this.textAlign = TextAlign.start,
    this.validator,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 327.w,
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        obscureText: obscureText,
        textAlign: textAlign,
        validator: validator,
        keyboardType: keyboard,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
          color: ColorsApp.whiteapp,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ColorsApp.cardcolor, width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ColorsApp.cardcolor, width: 2.w),
          ),
        ),
      ),
    );
  }
}
