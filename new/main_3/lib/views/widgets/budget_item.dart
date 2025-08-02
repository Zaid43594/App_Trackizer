import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/model/guage_segment-model.dart';

class BudgetItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String spent;
  final String left;
  final String total;
  final Color progressColor;
  final double progress;
  final GaugeSegment segment;

  const BudgetItem({
    super.key,
    required this.icon,
    required this.label,
    required this.spent,
    required this.left,
    required this.total,
    required this.progressColor,
    required this.progress,
    required this.segment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.h,
      width: 328.w,
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff4E4E61).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.r),
        border: Border(
          left: BorderSide(
            color: ColorsApp.bordercolorgrey,
            width: 1.w,
          ),
          top: BorderSide(
            color: ColorsApp.bordercolorgrey,
            width: 1.w,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, color: ColorsApp.titleapp, size: 32),
                    SizedBox(width: 12.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            label,
                            style: AppFont.H2(context, ColorsApp.whiteapp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6),
                          Text(
                            left,
                            style: AppFont.bodysmall(
                              context,
                              ColorsApp.titleapp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        spent,
                        style: AppFont.H2(context, ColorsApp.whiteapp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Text(
                        total,
                        style: AppFont.bodysmall(context, ColorsApp.titleapp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              FractionallySizedBox(
                widthFactor: segment.percent,
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: segment.color,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
