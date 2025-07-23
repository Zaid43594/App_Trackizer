import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';

class SubscriptionItem extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const SubscriptionItem({
    Key? key,
    required this.name,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.h,
        horizontal: 8.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorsApp.navbackground,
          width: 1.5,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 40.w,
          height: 40.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(color: ColorsApp.whiteapp),
        ),
        trailing: Text(
          price,
          style: TextStyle(color: ColorsApp.white70),
        ),
      ),
    );
  }
}
