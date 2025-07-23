import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/colors.dart';

class SimpleStepProgressBar extends StatelessWidget {
  const SimpleStepProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        BorderRadius radius;

        if (index == 0) {
          radius = const BorderRadius.only(
            topLeft: Radius.circular(3),
            bottomLeft: Radius.circular(3),
          );
        } else if (index == 3) {
          radius = const BorderRadius.only(
            topRight: Radius.circular(3),
            bottomRight: Radius.circular(3),
          );
        } else {
          radius = BorderRadius.zero;
        }

        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 5,
            decoration: BoxDecoration(
              color: ColorsApp.navbackground,
              borderRadius: radius,
            ),
          ),
        );
      }),
    );
  }
}
