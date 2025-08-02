
import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Gradient background;
  final Gradient borderGradient;
  final List<BoxShadow> boxShadow;
  final Color textColor;
  final Color iconColor;
  final double scale;
  final double textWidth;

  const SocialButton({
    required this.icon,
    required this.text,
    required this.background,
    required this.borderGradient,
    required this.boxShadow,
    required this.textColor,
    required this.iconColor,
    required this.scale,
    required this.textWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999 * scale),
        gradient: background,
        boxShadow: boxShadow,
        border: Border.all(width: 1 * scale, color: ColorsApp.transcolor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 16 * scale, height: 16 * scale, child: icon),
          SizedBox(width: 8 * scale),
          SizedBox(
            width: textWidth * scale,
            height: 20 * scale,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: AppFont.H2(context,textColor).copyWith(
                  
                  fontSize: 14 * scale,
                  height: 20 / 14,
                  letterSpacing: 0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
