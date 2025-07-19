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
      width: 104,
      height: 68,
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
              width: 46,
              height: 1.5,
              decoration: BoxDecoration(
                color: topColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(
                color: ColorsApp.titlecard,
                fontSize: 12.sp,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
