import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color topColor;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.topColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.w,
      height: 68.h,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          
        ),
        color: ColorsApp.cardcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 46.w,
              height: 1.5.h,
              decoration: BoxDecoration(
                color: topColor,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              label,
              style: TextStyle(
                color: ColorsApp.titlecard,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
