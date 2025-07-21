import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';

class IconButtonContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const IconButtonContainer({Key? key, required this.icon, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: ColorsApp.cardcolor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border(left: BorderSide(color: ColorsApp.textapp, width: 1)),
        ),
        child: Icon(icon, color: const Color(0xFF4E4E61), size: 24),
      ),
    );
  }
}
