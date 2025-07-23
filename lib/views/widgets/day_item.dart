import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
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
        border: Border(
          left: BorderSide(
            color: ColorsApp.bordercolorgrey,
          ),
          top: BorderSide(
            color: ColorsApp.bordercolorgrey,
          ),
        ),
        color:
            item.isActive ? const Color(0xff4E4E61) : const Color(0xff30303B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.day,
            style: AppFont.H4(
              context,
              Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            item.label,
            style: AppFont.bodysmall(
              context,
              ColorsApp.titleapp,
            ),
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
