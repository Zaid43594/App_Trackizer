import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';

class SubscriptionCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const SubscriptionCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.cardcolor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 50.w, height: 50.h),
            SizedBox(height: 30.h),
            Text(name, style: TextStyle(fontSize: 16.sp, color: ColorsApp.whiteapp)),
            SizedBox(height: 5.h),
            Text(price, style: TextStyle(fontSize: 18.sp, color: ColorsApp.whiteapp)),
          ],
        ),
      ),
    );
  }
}
