import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/fonts.dart';
import '../../core/constants/colors.dart';
import 'subscriptions_list.dart';
import 'upcoming_bills_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleTabs extends StatefulWidget {
  const ToggleTabs({Key? key}) : super(key: key);

  @override
  State<ToggleTabs> createState() => _ToggleTabsState();
}

class _ToggleTabsState extends State<ToggleTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 12.h),
          child: Container(
            decoration: BoxDecoration(
              color: ColorsApp.box,
              // color: Colors.red,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = 0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? ColorsApp.boxcolor
                            : ColorsApp.transcolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Your subscrptions",
                          style: AppFont.H1(
                            context,
                            selectedIndex == 0
                                ? ColorsApp.whiteapp
                                : ColorsApp.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? ColorsApp.boxcolor
                            : ColorsApp.transcolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Upcoming bills",
                          style: AppFont.H1(
                            context,
                            selectedIndex == 1
                                ? ColorsApp.whiteapp
                                : ColorsApp.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // AnimatedSwitcher مع SlideTransition
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            child: selectedIndex == 0
                ? SubscriptionsList(key: ValueKey(0))
                : UpcomingBillsList(key: ValueKey(1)),
          ),
        ),
      ],
    );
  }
}
