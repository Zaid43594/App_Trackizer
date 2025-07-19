import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import '../../../model/day_model.dart';

class DayItem extends StatelessWidget {
  final DayModel item;

  const DayItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 103.h,
      decoration: BoxDecoration(
        color: item.isActive
            ? ColorsApp.orangapp.withOpacity(0.15)
            : const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.day,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            item.label,
            style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
          ),
          SizedBox(
            height: 27.h,
          ),
          if (item.isActive)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: ColorsApp.orangapp,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
