import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // العنوان
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: AppFont.H2(
                context,
                ColorsApp.whiteapp,
              ),
            ),
          ),

          // القيمة
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppFont.bodysmall(
                context,
                ColorsApp.greyapp,
              ),
            ),
          ),

          // أيقونة السهم
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white24,
                size: 16,
              ),
              onPressed: onTap ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}
