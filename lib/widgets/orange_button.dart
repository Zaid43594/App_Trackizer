import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/style/colors.dart';
import 'package:trackizer/core/style/fonts.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  const OrangeButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 324.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: ColorsApp.rangeColor, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: ColorsApp.orangapp.withOpacity(0.6),
            blurRadius: 25,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.orangapp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Text(text, style: AppFont.H2(context, ColorsApp.whiteapp)),
      ),
    );
  }
}
